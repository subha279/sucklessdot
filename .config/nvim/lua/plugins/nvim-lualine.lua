return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  opts = {
    options = {
      themable = true,
      icons_enabled = true,
      --theme = 'tokyonight',
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "█", right = "█" },
      --component_separators = '(',
      --section_separators = { left = '', right = '' },
    }
  }
}
