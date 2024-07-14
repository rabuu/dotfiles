return {
	{
		"lervag/vimtex",
		config = function()
			vim.opt.conceallevel = 2
			vim.opt.concealcursor = "c"

			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.tex_conceal = "abdmg"

			vim.keymap.set("n", "<leader>vc", "<cmd>VimtexCompile<cr>")
		end,
		keys = {
			{
				"<leader>vc",
				"<cmd>VimtexCompile<cr>",
				ft = "tex",
				desc = "Compile LaTeX file",
			},
		},
	},
}
