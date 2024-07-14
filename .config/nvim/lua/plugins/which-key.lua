return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("which-key").add({
				{ "<leader>c", group = "code" },
				{ "<leader>d", group = "diagnostics" },
				{ "<leader>w", group = "window" },
				{ "<leader>b", group = "buffer" },
				{ "<leader>x", group = "basics" },
				{ "<leader>h", group = "harpoon" },
				{ "<c-h>", group = "help" },
			})
		end,
	},
}
