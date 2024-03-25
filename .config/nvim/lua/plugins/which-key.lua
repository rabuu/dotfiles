return {
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup()

			require("which-key").register({
				["<leader>c"] = { name = "Code", _ = "which_key_ignore" },
				["<leader>d"] = { name = "Diagnostics", _ = "which_key_ignore" },
				["<leader>w"] = { name = "Window", _ = "which_key_ignore" },
				["<leader>b"] = { name = "Buffer", _ = "which_key_ignore" },
				["<leader>x"] = { name = "Basics", _ = "which_key_ignore" },
				["<leader>h"] = { name = "Harpoon", _ = "which_key_ignore" },
				["<c-h>"] = { name = "Help", _ = "which_key_ignore" },
			})
		end,
	},
}
