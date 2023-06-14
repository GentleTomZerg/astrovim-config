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

  -- TODO: config nvim-dap for c/cpp
  -- {
  --   "mfussenegger/nvim-dap",
  --   opts = {
  --     codelldb = function()
  --       local codelldb_path, _ = get_codelldb()
  --       local dap = require "dap"
  --       dap.adapters.codelldb = {
  --         type = "server",
  --         port = "${port}",
  --         executable = {
  --           command = codelldb_path,
  --           args = { "--port", "${port}" },
  --
  --           -- On windows you may have to uncomment this:
  --           -- detached = false,
  --         },
  --       }
  --       dap.configurations.cpp = {
  --         {
  --           name = "Launch file",
  --           type = "codelldb",
  --           request = "launch",
  --           program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
  --           cwd = "${workspaceFolder}",
  --           stopOnEntry = false,
  --         },
  --       }
  --
  --       dap.configurations.c = dap.configurations.cpp
  --       dap.configurations.rust = dap.configurations.cpp
  --     end,
  --   },
  -- },
}
