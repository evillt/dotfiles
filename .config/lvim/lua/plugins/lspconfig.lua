-- builtin

local lsp = require("lspconfig")
local util = require("lspconfig.util")

local cwd = vim.fn.getcwd()
local project_root = util.find_node_modules_ancestor(cwd)

vim.lsp.set_log_level("ERROR")

-- unmap all preset buffer keymaps, use lspsaga instead
lvim.lsp.buffer_mappings.normal_mode = {}

-- disable auto install servers
lvim.lsp.installer.setup.automatic_installation = nil

lsp.tailwindcss.setup {
  root_dir = util.root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.ts')
}

lsp.lua_ls.setup {}

-- vue
-- enable take over mode, disable tsserver
local vue_path = util.path.join(project_root, "node_modules", "vue")
local is_vue = vim.fn.isdirectory(vue_path) == 1
if is_vue then
  lsp.volar.setup {
    filetypes = {
      'vue',
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'json',
    },
  }
  lsp.tsserver.setup {
    root_dir = function() return false end,
    single_file_support = false,
  }
end
