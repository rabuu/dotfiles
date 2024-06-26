return {
	"nvim-tree/nvim-web-devicons",

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-focus/focus.nvim",
		opts = {
			commands = false,
			ui = {
				signcolumn = false,
			},
		},
	},
}
