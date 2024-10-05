-- enable gui colors in tui
vim.opt.termguicolors = true

-- force light mode
vim.opt.background = "light"

-- set background to plain white
vim.api.nvim_command([[
augroup ChangeBackgroundColor
	autocmd colorscheme default :highlight Normal guibg=white ctermbg=white
augroup END
]])

-- enable default colorscheme
vim.cmd("silent! colorscheme default")
