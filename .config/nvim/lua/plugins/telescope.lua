return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						".git/",
						"target/",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzy")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<c-h>h", builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set("n", "<c-h>k", builtin.keymaps, { desc = "Keymaps" })
			vim.keymap.set("n", "<leader>xf", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>.", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>xb", builtin.buffers, { desc = "Find existing buffers" })
			vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Find existing buffers" })
			vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Find existing buffers" })
			vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>ds", builtin.diagnostics, { desc = "Search diagnostics" })
			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "Fuzzily search in current buffer" })
		end,
	},
}
