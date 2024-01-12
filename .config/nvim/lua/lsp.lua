local servers = {
	"typos_lsp", "bashls", "clangd", "cssls", "html", "jsonls", "tsserver",
	"texlab", "lua_ls", "pyright", "rust_analyzer", "taplo", "zls"
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local cap = vim.lsp.protocol.make_client_capabilities()
cap.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
for _,lsp in ipairs(servers) do
	lspconfig[lsp].setup({capabilities = cap})
end

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
	capabilities = cap,
})
