return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("which-key").add({
				-- { "<leader>c", group = "code" },
				{ "<leader>d", group = "diagnostics" },
				{ "<c-h>", group = "help" },
			})
		end,
	},
}
