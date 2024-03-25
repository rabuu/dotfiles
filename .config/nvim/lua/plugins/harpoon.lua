return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():append()
			end, { desc = "Append to harpoon" })

			vim.keymap.set("n", "<leader>he", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Open harpoon edit window" })

			local telescope_conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = telescope_conf.file_previewer({}),
						sorter = telescope_conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<leader>hh", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })
		end,
	},
}
