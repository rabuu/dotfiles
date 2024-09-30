vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("settings")
require("mappings")

vim.opt.background = "light"
vim.api.nvim_command([[
augroup ChangeBackgroundColor
	autocmd colorscheme default :highlight Normal guibg=white ctermbg=white
augroup END
]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd("silent! colorscheme default")
