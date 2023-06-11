# How to override installed plugins?

```
  -- user/commumity.lua
  -- project manager
  { import = "astrocommunity.project.project-nvim" },
  {
    "project.nvim",
    keys = {
      { "<leader>fp", "<cmd> Telescope projects<cr>" },
    },
  },
```

- Here imports a project related plugin through astrocommunity.
  
  the lua code relates to the import plugin are shown below,
  ```
  return {
    {
      "ahmedkhalf/project.nvim",
      event = "VeryLazy",
      opts = { ignore_lsp = { "lua_ls" } },
      config = function(_, opts) require("project_nvim").setup(opts) end,
    },
    { "nvim-telescope/telescope.nvim", opts = function() require("telescope").load_extension "projects" end },
  }
  ```

- In order to add key mappings, here overrides the `project.nvim`, add property `keys` to the original import lua script.

- **Summary**
  
  If we want to override plugins, we need to check the real script, find the exact name of the plugins, and add or update the properties.
