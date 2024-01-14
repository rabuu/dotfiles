local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local leader = "<space>"
vim.api.nvim_set_keymap("", leader, "<nop>", { noremap = true, silent = true })
vim.g.mapleader = vim.api.nvim_replace_termcodes(leader, true, true, true)
vim.g.maplocalleader = vim.g.mapleader

require("lazy").setup({
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				overrides = {
					Normal = { bg = "none" },
				},
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		config = true
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						".git/",
						"target/",
					},
				},
			})

			require("telescope").load_extension("fzy_native")
			require("telescope").load_extension("ui-select")
		end,
	},

	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.comment").setup()
			require("mini.operators").setup()
			require("mini.move").setup()
			require("mini.pairs").setup()
			require("mini.trailspace").setup()
			require("mini.notify").setup()
			require("mini.surround").setup({
				mappings = {
					add = "ys",
					delete = "ds",
					find = "",
					find_left = "",
					highlight = "",
					replace = "cs",
					update_n_lines = "",
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"hiphish/rainbow-delimiters.nvim"
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash", "c", "comment", "cpp", "css", "diff", "git_config", "git_rebase",
					"gitcommit", "gitignore", "haskell", "html", "java", "javascript", "jq",
					"json", "latex", "lua", "make", "markdown", "markdown_inline", "nasm",
					"python", "racket", "regex", "rust", "sql", "toml", "typescript", "vim",
					"yaml", "zig"
				},
				highlight = {
					enable = true,
				},
			})
		end,
	},

	"nvim-tree/nvim-web-devicons",

	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("completion")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("lsp")
		end,
	},

	{
		"lervag/vimtex",
		config = function()
			vim.opt.conceallevel = 2
			vim.opt.concealcursor = "c"

			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.tex_conceal = "abdmg"
		end,
	},

	{
		"rust-lang/rust.vim",
		config = function()
			vim.g.rustfmt_autosave = 1
		end
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^3",
		ft = { "rust" },
	}
})

vim.cmd("colorscheme gruvbox")

require("settings")
require("mappings")
require("autocmds")
