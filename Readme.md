<!--toc:start-->

- [How to override installed plugins?](#how-to-override-installed-plugins)
- [Using AstroNvim to develop C/C++](#using-astronvim-to-develop-cc)
<!--toc:end-->

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

# Using AstroNvim to develop C/C++

- lsp: clangd

  :star: To offer better performance of clangd, we need `compile_command.json`.
  However, this is generated under the `project/build/` directory. A script written in GPT would help us to move it to the project directory without making a symlink.

  ```tex
  project(employee)
  set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

  set(CMAKE_BUILD_TYPE Debug)

  add_executable(test employee.cc test.cc)

  add_custom_command(
  TARGET test POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  ${CMAKE_BINARY_DIR}/compile_commands.json
  ${CMAKE_BINARY_DIR}/../compile_commands.json
  )
  ```

- format: clang-format

:star:A `.clang-format` must be placed under the root directory of the c/c++ project.
Using `clang-format -style=google -dump-config > .clang-format` to generate a google style format configuration.

- linter: cpplint
