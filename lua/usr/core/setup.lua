-- Forzar reconocimiento de archivos Zsh para compatibilidad con LSP/Linters
vim.filetype.add({
	extension = {
		zsh = "sh",
		zshrc = "sh",
		zprofile = "sh",
	},
})

-- Detectar archivos de Jekyll/ERB como Ruby/HTML
vim.filetype.add({
	extension = {
		erb = "eruby",
	},
})

vim.g.loaded_perl_provider = 0

-- Binarios propios (stylua, prettier, black, isort, pylint, shfmt, shellcheck, hadolint)
local local_bin = vim.fn.expand("~/.local/bin")
if not vim.env.PATH:find(local_bin, 1, true) then
	vim.env.PATH = local_bin .. ":" .. vim.env.PATH
end

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.wildoptions = "pum"

-- Rendimiento y comportamiento
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Python y shell usan 4 espacios (black y shfmt lo toman de shiftwidth)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sh", "bash", "zsh", "python" },
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
	end,
})

