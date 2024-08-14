return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      source = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        {
          name = 'clang-format',
          enabled = true,
          command = 'clang-format -style=file',
          filetypes = { 'c', 'cpp' },
        },
        {
          name = 'nixpkgs-fmt',
          enabled = true,
          filetypes = { 'nix' },
        },

      }
    })
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {desc = "Code Formmat"})
  end
}
