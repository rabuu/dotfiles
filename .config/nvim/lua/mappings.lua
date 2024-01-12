local map = vim.keymap.set

-- telescope
local t = require("telescope.builtin")
map("n", "<leader>tf", t.find_files, {})
map("n", "<leader>.", t.find_files, {})
map("n", "<leader>tb", t.buffers, {})
map("n", "<leader>,", t.buffers, {})
map("n", "<leader>tg", t.live_grep, {})
map("n", "<leader>/", t.live_grep, {})

-- buffers
map("n", "<leader>bc", ":enew<cr>", {})
map("n", "<leader>bd", ":bdelete<cr>", {})
map("n", "<leader>bp", ":bprevious<cr>", {})
map("n", "<leader>bn", ":bnext<cr>", {})

-- simple spell checking
map("n", "<leader>sp", ":setlocal spell! spelllang=en_us,de_20", {})

-- disable highlighting of search results
map("n", "//", ":nohlsearch<cr>", {})

-- lsp
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>fm', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
