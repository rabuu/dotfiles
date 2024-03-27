return {
	"tpope/vim-sleuth",

	{ "karb94/neoscroll.nvim", config = true },

	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			use_diagnostic_digns = true,
		},
		config = function(_, opts)
			require("trouble").setup(opts)
			vim.keymap.set("n", "<leader>dt", function()
				require("trouble").toggle()
			end, { desc = "Trouble" })
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},

	{
		"stevearc/oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("oil").setup({
				skip_confirm_for_simple_edits = true,
				keymaps = {
					["q"] = "actions.close",
					["^"] = "actions.parent",
				},
			})
			vim.keymap.set("n", "<leader>xo", "<cmd>Oil<cr>", { desc = "Open oil file browser" })
		end,
	},
}
