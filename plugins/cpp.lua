local utils = require "astronvim.utils"

local function get_codelldb()
  local mason_registry = require "mason-registry"
  local codelldb = mason_registry.get_package "codelldb"
  local extension_path = codelldb:get_install_path() .. "/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
  return codelldb_path, liblldb_path
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "c", "cpp" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "clangd" }) end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "clang_format" })
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "codelldb" }) end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "p00f/clangd_extensions.nvim" },
    opts = {
      servers = {
        clangd = {},
      },

      -- WARN: Didn't work here, the format warning still exists
      -- the temporary solution is to modify the lsp section in init.lua
      -- config = {
      --   clangd = {
      --     capabilities = { offsetEncoding = "utf-8" },
      --   },
      -- },

      handlers = {
        clangd = function(_, _)
          local clangd_flags = {
            "--background-index",
            "--fallback-style=Google",
            "--all-scopes-completion",
            "--clang-tidy",
            "--log=error",
            "--suggest-missing-includes",
            "--cross-file-rename",
            "--completion-style=detailed",
            "--pch-storage=memory",     -- could also be disk
            "--folding-ranges",
            "--enable-config",          -- clangd 11+ supports reading from .clangd configuration file
            "--offset-encoding=utf-16", --temporary fix for null-ls
          }
          require("clangd_extensions").setup {
            server = {
              cmd = { "clangd", unpack(clangd_flags) },
            },
          }
          return true
        end,
      },
    },
  },

  -- TODO: config nvim-dap for c/cpp
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      handlers = {
        codelldb = function()
          local codelldb_path, _ = get_codelldb()
          local dap = require "dap"
          dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
              command = codelldb_path,
              args = { "--port", "${port}" },

              -- On windows you may have to uncomment this:
              -- detached = false,
            },
          }
          dap.configurations.cpp = {
            {
              name = "Launch file",
              type = "codelldb",
              request = "launch",
              program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
            },
          }

          dap.configurations.c = dap.configurations.cpp
          dap.configurations.rust = dap.configurations.cpp
        end,
      },
    },
  },
}
