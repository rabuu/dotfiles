" disable automatic continuation of comments
autocmd FileType * setlocal formatoptions-=cro

" rainbow parentheses
autocmd FileType * RainbowParentheses

" execute xrdb after writing to xresources
autocmd BufWritePost Xresources !xrdb %
