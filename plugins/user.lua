return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- Todo Plugin
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    -- the plugin will be lazy loaded
    -- here show 3 triggers to load the plugin
    -- 1. a file is open
    -- 2. command line input
    -- 3. keys
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>fq", "<cmd>TodoTelescope<cr>", desc = "Find TODO" },
    },
  },

  -- override heirline statusline
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"
      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
        status.component.git_branch { surround = { separator = "left" } },
        status.component.file_info {
          surround = { separator = "left" },
          filetype = {},
          filename = false,
          file_modified = false,
        },
        status.component.git_diff { surround = { separator = "left" } },
        status.component.diagnostics { surround = { separator = "left" } },
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp { surround = { separator = "right" } },
        status.component.treesitter { surround = { separator = "right" } },
        status.component.nav { scrollbar = false, surround = { separator = "right" } },
      }
      return opts
    end,
  },

  -- Markdown-preview
  {
    "iamcco/Markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
    cmd = { "MarkdownPreview" },
  },
}
