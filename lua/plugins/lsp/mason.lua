return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		require("neodev").setup()

		local mason = require("mason")
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"html",
				"cssls",
				"tailwindcss",
				"gopls",
				"rust_analyzer",
				"clangd",
				"dockerls",
				"emmet_ls",
				"emmet_language_server",
				"marksman",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"pylint",
				"clangd",
				"denols",
				{ "eslint_d", version = "13.1.2" },
			},

			handlers = {
				-- Default handler for all servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- Custom handler for lua_ls
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
				end,

				-- Custom handler for emmet_ls
				["emmet_ls"] = function()
					lspconfig.emmet_ls.setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,

				-- Custom handler for emmet_language_server
				["emmet_language_server"] = function()
					lspconfig.emmet_language_server.setup({
						filetypes = {
							"css",
							"eruby",
							"html",
							"javascript",
							"javascriptreact",
							"less",
							"sass",
							"scss",
							"pug",
							"typescriptreact",
						},
						init_options = {
							includeLanguages = {},
							excludeLanguages = {},
							extensionsPath = {},
							preferences = {},
							showAbbreviationSuggestions = true,
							showExpandedAbbreviation = "always",
							showSuggestionsAsSnippets = false,
							syntaxProfiles = {},
							variables = {},
						},
					})
				end,

				-- Custom handler for denols
				["denols"] = function()
					lspconfig.denols.setup({
						capabilities = capabilities,
						root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
					})
				end,

				-- Custom handler for tsserver
				["ts_ls"] = function()
					lspconfig.ts_ls.setup({
						capabilities = capabilities,
						root_dir = function(fname)
							local util = lspconfig.util
							return not util.root_pattern("deno.json", "deno.jsonc")(fname)
								and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
						end,
						single_file_support = false,
						init_options = {
							preferences = {
								includeCompletionsWithSnippetText = true,
								includeCompletionsForImportStatements = true,
							},
						},
					})
				end,
			},
		})
	end,
}

