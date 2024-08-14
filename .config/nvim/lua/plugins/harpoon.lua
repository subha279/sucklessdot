return {
  "ThePrimeagen/harpoon",
  enabled = true,
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function(_, opts)
    require("harpoon").setup(opts)
  end,

  keys = function()
    local harpoon = require("harpoon")
    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end
      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    return {
      -- Set Keymaps
      -- Harpoon buffer select
      { "<a-1>",      function() harpoon:list():select(1) end,         desc = "Harpoon buffer 1" },
      { "<a-2>",      function() harpoon:list():select(2) end,         desc = "Harpoon buffer 2" },
      { "<a-3>",      function() harpoon:list():select(3) end,         desc = "Harpoon buffer 3" },
      { "<a-4>",      function() harpoon:list():select(4) end,         desc = "Harpoon buffer 4" },

      -- Harpoon next and previous.
      { "<a-n>",      function() harpoon:list():next() end,            desc = "Harpoon next buffer" },
      { "<a-p>",      function() harpoon:list():prev() end,            desc = "Harpoon prev buffer" },

      -- Harpoon user interface.
      --{ "<leader>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Toggle Menu" },
      { "<a-a>",      function() harpoon:list():add() end,             desc = "Harpoon add file" },

      -- Use Telescope as Harpoon user interface.
      { "<leader>fh", function() toggle_telescope(harpoon:list()) end, desc = "Open Harpoon window" },
    }
  end,

  -- Harpoon customizations.
  opts = function(_, opts)
    opts.settings = {
      save_on_toggle = false,
      sync_on_ui_close = false,
      save_on_change = true,
      enter_on_sendcmd = false,
      tmux_autoclose_windows = false,
      excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
      mark_branch = false,
      key = function()
        return vim.loop.cwd()
      end
    }
  end,
}
