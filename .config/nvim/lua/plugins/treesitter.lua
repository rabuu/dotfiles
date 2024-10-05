return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function() require("nvim-treesitter.install").update() end,
		lazy = true,
		event = "VeryLazy",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		opts = {
			ensure_installed = {
				"c",
				"comment",
				"cpp",
				"diff",
				"gitcommit",
				"latex",
				"markdown",
				"markdown_inline",
				"rust",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
	},
}
