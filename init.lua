-- Minimal neovim config

-- Relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Yank paste clipboard
vim.o.clipboard = "unnamedplus"

-- Autocomplete with no inserting
vim.o.completeopt = "menuone,noinsert"

-- Set leader
vim.g.mapleader = " "

-- Sign column for git and stuff
vim.o.signcolumn = "number"

-- Remove highlighting after search
vim.o.hlsearch = false

-- Tab size 2 spaces
vim.o.shiftwidth = 2

-- Enable zsh as default shell
vim.opt.shell = vim.fn.executable("zsh") == 1 and vim.fn.exepath("zsh") or "/bin/sh"

-- Keybindings
vim.keymap.set("n", "<leader>O", "<CMD>Oil<CR>", { desc = "Open current directory" })

vim.keymap.set("n", "tt", ":tabnext<CR>", { desc = "Move to the next tab" })
vim.keymap.set("n", "TT", ":tabprevious<CR>", { desc = "Move to the previous tab" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Exit the termianl by pressing Esc
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Open a new tab by pressing leader, t, n
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Open a new tab" })

-- Don't yank text that you replace
vim.keymap.set("v", "p", '"_dP', opts)

-- Open Neogit with gg
vim.keymap.set("n", "<leader>gg", function()
	require("neogit").open({ kind = "tab" })
end, { desc = "Open Neogit UI in new tab" })

-- Configure Oil
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	delete_to_trash = true,
	columns = {
		"icon",
		"permissions",
		"size",
		"mtime",
	},
})

-- Configure telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })

-- Colorscheme
vim.cmd.colorscheme("gruvbox")

-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = true, -- Show diagnostics inline
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Lsp configs with nvim-lspconfig
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			-- Enables vim.* completions, sadly required
			runtime = {
				version = "LuaJIT" },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			diagnostics = { globals = { "vim" } },
		}
	}
})

vim.lsp.enable({ "lua_ls", "clangd", "nil_ls", "pyright", "cmake", "rust_analyzer" })

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<leader>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})
