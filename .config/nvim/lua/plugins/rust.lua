return {
	{
		"rust-lang/rust.vim",
		ft = { "rust" },
		config = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^3",
		ft = { "rust" },
	},
}
