return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.basics").setup({
				options = {
					basic = true,
					extra_ui = true,
				},
				mappings = {
					basic = true,
					option_toggle_prefix = "<leader>t",
					windows = true,
					move_with_alt = true,
				},
				autocommands = {
					basic = true,
					relnum_in_visual_mode = true,
				}
			})
			require("mini.bracketed").setup()
			require("mini.comment").setup()
			require("mini.diff").setup()
			require("mini.git").setup()
			require("mini.icons").setup()
			require("mini.move").setup()
			require("mini.notify").setup()
			require("mini.pairs").setup()
			require("mini.statusline").setup()
			require("mini.surround").setup({
				mappings = {
					add = "ys",
					delete = "ds",
					find = "",
					find_left = "",
					highlight = "",
					replace = "cs",
					update_n_lines = "",
				},
			})
		end,
	},
}
