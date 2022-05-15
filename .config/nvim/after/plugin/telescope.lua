local status_telescope_ok, telescope = pcall(require, 'telescope')
if (not status_telescope_ok) then return end

local actions = require('telescope.actions')
-- Global remapping
------------------------------
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ['<C-c>'] = actions.close,
      },
      n = {
        ["<esc>"] = actions.close,
      },
    },
    -- https://github.com/nvim-telescope/telescope.nvim/issues/522#issuecomment-777384452
    file_ignore_patterns = {
      "node_modules/",
      ".git/",
      -- rust
      "**/debug/",
      "target/release/",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      -- find_command = {"fd"},
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
    },
    ['ui-select'] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('ui-select')