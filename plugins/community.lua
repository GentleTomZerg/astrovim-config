return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  --
  --
  --
  -- Language Packs
  { import = "astrocommunity.pack.java" },
  {
    "nvim-jdtls",
    keys = {
      { "<leader>df", "<cmd> lua require'jdtls'.test_class() <cr>", desc = "Test all" },
      { "<leader>dn", "<cmd> lua require'jdtls'.test_nearest_method() <cr>", desc = "Test method" },
    },
  },

  { import = "astrocommunity.pack.lua" },

  { import = "astrocommunity.pack.markdown" },

  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python" },

  -- treesitter
  -- colorful parenthesis
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },

  -- motions
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.flash-nvim" },

  -- utility
  -- graphic command line in neovim
  { import = "astrocommunity.utility.noice-nvim" },

  -- colorscheme
  -- the customization of nvim-notify should not be altered
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#00",
    },
  },
  -- { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     style = "storm",
  --     transparent = true,
  --   },
  -- },
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
  },

  -- project manager
  { import = "astrocommunity.project.project-nvim" },
  {
    "jay-babu/project.nvim",
    keys = {
      { "<leader>fp", "<cmd> Telescope projects<cr>", desc = "Find projects" },
    },
  },

  -- status line and winbar
  { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },

  -- lsp plugin
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },

  -- code runner
  { import = "astrocommunity.code-runner.compiler-nvim" },

  -- debug
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },

  -- diagnostic
  { import = "astrocommunity.diagnostics.trouble-nvim" },
}
