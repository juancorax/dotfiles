local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

g.mapleader = " "
g.maplocalleader = " "

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.expandtab = true
opt.hlsearch = false
opt.ignorecase = true
opt.list = true
opt.listchars = { tab = "  " }
opt.mouse = ""
opt.scrolloff = 10
opt.shiftwidth = 4
opt.showmode = false
opt.sidescrolloff = 20
opt.signcolumn = "no"
opt.smartcase = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.undofile = true
opt.updatetime = 1000
opt.wrap = false

cmd("colorscheme retrobox")
