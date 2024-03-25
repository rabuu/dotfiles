return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			contrast = "hard",
			overrides = {
				Normal = { bg = "none" },
			},
		},
		init = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
