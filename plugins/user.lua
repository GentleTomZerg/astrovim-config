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
}
