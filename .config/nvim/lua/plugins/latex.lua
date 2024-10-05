return {
	"lervag/vimtex",
	lazy = false,
	config = function()
		vim.opt.conceallevel = 2
		vim.opt.concealcursor = "c"

		vim.g.tex_flavor = "latex"
		vim.g.vimtex_view_method = "general"
		vim.g.vimtex_view_general_viewer = "okular"
		vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
		vim.g.vimtex_quickfix_mode = 0
		vim.g.tex_conceal = "abdmg"
	end,
	keys = {
		{
			"<leader>vc",
			"<cmd>VimtexCompile<cr>",
			ft = "tex",
			desc = "Compile LaTeX file",
		},
	},
}
