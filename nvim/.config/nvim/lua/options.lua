-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.relativenumber = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd([[ set noswapfile ]])
vim.cmd([[ set termguicolors ]])

-- Saving the old way
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a")
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>^V")

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

--Line numbers
vim.wo.number = true

vim.keymap.set("n", "<leader>hh", ":nohlsearch<CR>", { desc = "Reset search" })

-- view
vim.keymap.set("n", "<leader>vh", ":split<CR>", { desc = "Horizontal split"})
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", { desc = "Vertical split"})

-- barbar
-- Move to previous/next
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<A-;>", "<Cmd>BufferNext<CR>")
-- Re-order to previous/nextA
vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>")
-- Goto buffer in position...
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")
-- Pin/unpin buffer
vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>")
-- Close buffer
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>")

