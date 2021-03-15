" completion with snippets
inoremap <silent><expr> <tab>
			\ pumvisible() ? coc#_select_confirm() :
			\ coc#expandableOrJumpable() ? "\<c-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump'])\<cr>" :
			\ <sid>check_back_space() ? "\<tab>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next='<tab>'
let g:coc_snippet_last='<s-tab>'
xmap <tab> <Plug>(coc-snippets-select)
