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

  -- treesitter
  -- colorful parenthesis
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2" },

  -- motions
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.leap-nvim" },

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
    "project.nvim",
    keys = {
      { "<leader>fp", "<cmd> Telescope projects<cr>", desc = "Find projects" },
    },
  },

  -- status line and winbar
  { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
}
