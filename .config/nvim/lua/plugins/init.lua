return {
	"tpope/vim-sleuth",

	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				skip_confirm_for_simple_edits = true,
				keymaps = {
					["q"] = "actions.close",
					["^"] = "actions.parent",
				},
			})

			vim.keymap.set("n", "<leader>f", "<cmd>Oil<cr>", { desc = "Open oil file browser" })
		end,
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

}
