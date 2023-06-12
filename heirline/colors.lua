local colors = {
  cursor = {
    text = "#CDD6F4",
    cursor = "#D9D9D9",
  },

  normal = {
    black = "#080808",
    red = "#E86671",
    green = "#98C379",
    yellow = "#E5C07B",
    blue = "#61AFEF",
    magenta = "#C678DD",
    cyan = "#54AFBC",
    white = "#c6c6c6",
    grey = "#303030",
  },
}

return {
  bg = colors.black,
  mode_fg = colors.normal.black,

  git_branch_fg = colors.normal.yellow,
  git_branch_bg = colors.normal.grey,

  file_info_fg = colors.normal.white,
  file_info_bg = colors.normal.grey,

  git_diff_fg = colors.normal.white,
  git_diff_bg = colors.normal.grey,

  diagnostics_fg = colors.normal.white,
  diagnostics_bg = colors.normal.grey,

  lsp_fg = colors.normal.white,
  lsp_bg = colors.normal.grey,

  treesitter_fg = colors.normal.white,
  treesitter_bg = colors.normal.grey,

  nav_fg = colors.normal.white,
  nav_bg = colors.normal.grey,
}
