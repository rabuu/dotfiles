-- highlight yanked text
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual"})
augroup END
]])

-- xrdb Xresources
vim.cmd("autocmd BufWritePost Xresources !xrdb %")
