" leader key
nnoremap <space> <nop>
let g:mapleader="\<space>"

" toggle spell checking
map <leader>s :setlocal spell! spelllang=en_us,de_20<cr>

" comment out lines
nnoremap <space>/ :Commentary<cr>
vnoremap <space>/ :Commentary<cr>

" disable highlighting search results
nnoremap // :nohlsearch<cr>

" better tabbing
vnoremap < <gv
vnoremap > >gv

" move between splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" show documentation
nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" go to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" rename symbol
nmap <leader>r <plug>(coc-rename)

" macro over range
xnoremap @ :<c-u>call ExecuteMacroOverVisualRange()<cr>

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction
