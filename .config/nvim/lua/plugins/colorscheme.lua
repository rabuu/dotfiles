return {
	{
		-- "ellisonleao/gruvbox.nvim",
		-- opts = {
		-- 	contrast = "hard",
		-- 	overrides = {
		-- 		Normal = { bg = "none" },
		-- 		SignColumn = { bg = "none" },
		-- 	},
		-- },

		-- 	"catppuccin/nvim",
		-- 	name = "catppuccin",
		--
		-- 	lazy = true,
		-- 	priority = 1000,
		-- 	init = function()
		-- 		vim.g.background = "light"
		-- 		vim.cmd.colorscheme("catppuccin")
		-- 	end,

		"miikanissi/modus-themes.nvim",
		lazy = true,
		priority = 1000,
		init = function()
			vim.opt.background = "light"
			vim.cmd.colorscheme("modus")
		end,
	},
}
