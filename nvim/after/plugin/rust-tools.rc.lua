local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
	return
end
-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end
-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap -- for conciseness
	-- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	-- set keybinds
	-- Hover actions
	--keymap.set("n", "cv", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
	-- Code action groups
	--keymap.set("n", "cg", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
	keymap.set("n", "cd", "<cmd>RustHoverActions<CR>", opts) -- see outline on right hand side
  end
local opts = {
	tools = {
		executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
		reload_workspace_from_cargo_toml = true,
		-- autoSetHints = true,
        -- hover_action_automatic_focus = true,
		inlay_hints = {
			auto = true,
			only_current_line = false,
			show_parameter_hints = false,
			parameter_hints_prefix = "  ",
			other_hints_prefix = "  ",
			max_len_align = false,
			max_len_align_padding = 1,
			right_align = false,
			right_align_padding = 7,
			highlight = "Comment",
		},
		hover_actions = {
			border = {
			       { "╭", "FloatBorder" },
			       { "─", "FloatBorder" },
			       { "╮", "FloatBorder" },
			       { "│", "FloatBorder" },
			       { "╯", "FloatBorder" },
			       { "─", "FloatBorder" },
			       { "╰", "FloatBorder" },
			       { "│", "FloatBorder" },
			},
			auto_focus = true,
		},
	},
	server = {
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				-- assist = {
                --     importGranularity = "module",
                --     importEnforceGranularity = true
                -- },
                -- cargo = {
                --     loadOutDirsFromCheck = true
                -- },
                -- procMacro = {
                --     enable = true
                -- },
				-- cargo = {
				-- 	allFeatures = true,
				-- },
				checkOnSave = {
					-- allFeatures = true,
					command = "clippy",
				},
				-- experimental = {
                --     procAttrMacros = true
                -- },
                -- hoverActions = {
                --     references = true
                -- },
                -- lens = {
                --     methodReferences = true,
                --     references = true
                -- }
			},
		},
	},
}
rust_tools.setup(opts)