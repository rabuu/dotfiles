return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("which-key").add({
			{ "<leader>t", group = "telescope" },
			{ "<leader>T", group = "toggle" },
			{ "<leader>h", group = "harpoon" },
		})
	end,
}
