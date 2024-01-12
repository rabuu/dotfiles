-- CMP

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = {
		["<tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,

		["<s-tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,

		["<down>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,

		["<up>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,

		["<c-n>"] = cmp.mapping.select_next_item(),
		["<c-p>"] = cmp.mapping.select_prev_item(),
		["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
		["<c-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<cr>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- LSP

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")

local default_config_servers = { "bashls", "clangd", "gopls", "pyright", "texlab", "tsserver" }
for _, lsp in ipairs(default_config_servers) do
	lspconfig[lsp].setup({ capabilities = capabilities })
end

lspconfig.cssls.setup({
	cmd = { "vscode-css-languageserver", "--stdio" },
	capabilities = capabilities,
})

lspconfig.html.setup({
	cmd = { "vscode-html-languageserver", "--stdio" },
	capabilities = capabilities,
})

lspconfig.jsonls.setup({
	cmd = { "vscode-json-languageserver", "--stdio" },
	capabilities = capabilities,
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } }
		}
	},
	capabilities = capabilities,
})
