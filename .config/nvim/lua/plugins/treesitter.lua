return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"hiphish/rainbow-delimiters.nvim",
		},
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"comment",
				"css",
				"diff",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"haskell",
				"html",
				"java",
				"javascript",
				"json",
				"latex",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"nasm",
				"python",
				"regex",
				"rust",
				"toml",
				"typescript",
				"vim",
				"yaml",
				"zig",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		},
		config = function(_, opts)
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
