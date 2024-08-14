return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    --treesitter Keybinds/setups
    local config = require("nvim-treesitter.configs")
    config.setup({
      autotag = { enable = true },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "c", "lua", "bash", "python", "css", "html", "json", "yaml",
      },
    })
  end
}
