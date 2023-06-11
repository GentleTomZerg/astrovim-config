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
      { "<leader>df", "<cmd> lua require'jdtls'.test_class() <cr>",          desc = "Test all" },
      { "<leader>dn", "<cmd> lua require'jdtls'.test_nearest_method() <cr>", desc = "Test method" },
    },
  },

  { import = "astrocommunity.pack.lua" },

  -- scrolling
  -- { import = "astrocommunity.scrolling.cinnamon-nvim" },

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
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "catppuccin",
    opts = {
      flavour = "mocha",
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
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        -- TODO: let lualine show lsp status
        lualine_x = { "" },
        lualine_y = { "encoding", "filetype" },
        lualine_z = { "progress", "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },
}
