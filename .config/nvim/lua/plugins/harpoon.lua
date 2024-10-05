return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	lazy = false,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	opts = {
		settings = { sync_on_ui_close = true },
	},
	keys = {
		{
			"<Leader>hh",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "quick menu",
		},
		{
			"<Leader>ha",
			function() require("harpoon"):list():add() end,
			desc = "add entry",
		},
		{
			"<Leader>hn",
			function() require("harpoon"):list():next() end,
			desc = "next entry",
		},
		{
			"<Leader>hp",
			function() require("harpoon"):list():prev() end,
			desc = "previous entry",
		},
	},
}
