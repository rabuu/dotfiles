return {
	"scalameta/nvim-metals",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = { "scala", "sbt", "java" },
	opts = function()
		local conf = require("metals").bare_config()

		conf.settings.showImplicitArguments = true
		conf.init_options.statusBarProvider = "off"
		conf.capabilities = require("cmp_nvim_lsp").default_capabilities()

		return conf
	end,
	config = function(self, conf)
		local metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = self.ft,
			callback = function() require("metals").initialize_or_attach(conf) end,
			group = metals_group,
		})
	end,
}
