-- keymappings.lua

-- Modes:
--   * All          = "",
--   * Normal       = "n",
--   * Insert       = "i",
--   * Visual       = "v",
--   * Visual Block = "x",
--   * Command      = "c",
--   * Term         = "t",

-- Define alias for keymap
local keymap = vim.api.nvim_set_keymap
-- Define keymap params
local opts = { noremap = true, silent = true }
-- Assign leader key to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ===== Split Management ===========================================
-- Create splits
keymap("n", "<Leader>v", ":vsplit<CR>", opts)
keymap("n", "<Leader>V", ":split<CR>", opts)
-- Navigate between splits
keymap("n", "<Leader>h", "<C-w><Left>", opts)
keymap("n", "<Leader>j", "<C-w><Down>", opts)
keymap("n", "<Leader>k", "<C-w><Up>", opts)
keymap("n", "<Leader>l", "<C-w><Right>", opts)
-- Close current split
keymap("n", "<Leader>w", ":<C-w>q<CR>", opts)
-- Resize current split
keymap("n", "<C-Up>",     ":resize +2<CR>", opts)
keymap("n", "<C-Down>",   ":resize -2<CR>", opts)
keymap("n", "<C-Left>",   ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>",  ":vertical resize +2<CR>", opts)

-- ===== Buffer Management ===========================================
-- Navigation
keymap("n", "<C-Tab>",    "<Plug>(cokeline-focus-next)", opts)
keymap("n", "<C-S-Tab>",  "<Plug>(cokeline-focus-prev)", opts)
-- Rearrange Buffers
keymap("n", "<C-[>", "<Plug>(cokeline-switch-prev)", opts)
keymap("n", "<C-]>", "<Plug>(cokeline-switch-next)", opts)
-- Close Buffer
function CloseBuffer()
  if #vim.fn.getbufinfo({ buflisted = true}) == 1 then
    vim.cmd("bd")
  else
    vim.cmd("bp|bd #")
  end
end
keymap("n", "<C-w>", ":lua CloseBuffer()<CR>", opts)

-- ===== Options =====================================================
-- Toggle Spellcheck
keymap("n", "<Leader>s", ":set spell!<CR>", opts)
-- Toggle Line Numbers
keymap("n", "<Leader>n", ":set number!<CR>", opts)
-- Toggle Linebreak
keymap("n", "<Leader>b", ":set linebreak!<CR>", opts)
-- Toggle Line Wrap
keymap("n", "<Leader>W", ":set wrap!<CR>", opts)
-- Toggle Colorizer
keymap("n", "<Leader>c", ":ColorizerToggle<CR>", opts)
-- Toggle Color Column
keymap("n", "<Leader>C", ":execute 'set colorcolumn=' . (&colorcolumn == '' ? '70' : '')<CR>", opts)

-- ===== Navigation ==================================================
-- Jump to start/end of line
keymap("", "H", "^", opts)
keymap("", "L", "$", opts)
-- Navigating up/down lines faster
keymap("", "J", "5j", opts)
keymap("", "K", "5k", opts)
-- Navigating up/down visual lines rather than logical lines
keymap("", "j", "gj", opts)
keymap("", "k", "gk", opts)

-- ===== Delete ======================================================
-- Delete text up to start/end of line
keymap("n", "dH", "d0", opts)
keymap("n", "dL", "ld$", opts)
-- Delete word with backspace
keymap("i", "<C-BS>", "<C-w>", opts)

-- ===== Save/Quit ===================================================
-- Saving File
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<Esc>:w<CR>", opts)
keymap("v", "<C-s>", "<Esc>:w<CR>", opts)
-- Exiting NeoVim (w/o saving)
keymap("n", "<C-q>", ":q!<CR>", opts)
keymap("i", "<C-q>", "<Esc>:q!<CR>", opts)
keymap("v", "<C-q>", "<Esc>:q!<CR>", opts)

-- ===== NeoTree =====================================================
-- Open NeoTree
-- keymap("n", "<C-n>", "<Cmd>Neotree toggle<CR>", opts)
-- Open nvim-tree
keymap("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>", opts)
keymap("i", "<C-n>", "<Cmd>NvimTreeToggle<CR>", opts)
keymap("v", "<C-n>", "<Cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>e", "<Cmd>NvimTreeFocus<CR>", opts)
keymap("i", "<Leader>e", "<Cmd>NvimTreeFocus<CR>", opts)
keymap("v", "<Leader>e", "<Cmd>NvimTreeFocus<CR>", opts)

-- ===== Telescope ===================================================
-- Find files
keymap("n", "<C-f>", "<Cmd>Telescope find_files<CR>", opts)
keymap("i", "<C-f>", "<Cmd>Telescope find_files<CR>", opts)
keymap("v", "<C-f>", "<Cmd>Telescope find_files<CR>", opts)
-- Find text
keymap("n", "<C-g>", "<Cmd>Telescope live_grep<CR>", opts)
keymap("i", "<C-g>", "<Cmd>Telescope live_grep<CR>", opts)
keymap("v", "<C-g>", "<Cmd>Telescope live_grep<CR>", opts)
--ToggleTerm
--Float
keymap("n", "<C-t>", "<Cmd>ToggleTerm direction=float<CR>", opts)
keymap("i", "<C-t>", "<Cmd>ToggleTerm direction=float<CR>", opts)
keymap("v", "<C-t>", "<Cmd>ToggleTerm direction=float<CR>", opts)
--Horizontal
keymap("n", "<C-h>", "<Cmd>ToggleTerm direction=horizontal<CR>", opts)
keymap("i", "<C-h>", "<Cmd>ToggleTerm direction=horizontal<CR>", opts)
keymap("v", "<C-h>", "<Cmd>ToggleTerm direction=horizontal<CR>", opts)
--Vertical
keymap("n", "<C-l>", "<Cmd>ToggleTerm direction=vertical<CR>", opts)
keymap("i", "<C-l>", "<Cmd>ToggleTerm direction=vertical<CR>", opts)
keymap("v", "<C-l>", "<Cmd>ToggleTerm direction=vertical<CR>", opts)

-- ===== Icon-Picker =================================================
-- Select emoji
keymap("n", "<C-e>", "<Cmd>IconPickerNormal emoji<CR>", opts)
keymap("i", "<C-e>", "<Esc><Cmd>IconPickerNormal emoji<CR>", opts)

-- ===== Trouble =====================================================
-- Open Trouble window
keymap("n", "<Leader>x", "<Cmd>TroubleToggle<CR>", opts)

-- ===== Misc ========================================================
-- Escape to Normal Mode
keymap("i", "kj", "<Esc>", opts)
keymap("n", "<C-p>", "<Cmd>PetsNewCustom dog beige lol<CR>", opts)
keymap("n", "<C-S-p>", "<Cmd>PetsNew hell<CR>", opts)
-- Clear search pattern highlighting
keymap("n", "<Esc>", ":noh<CR>", opts)
-- Indent and Stay in Visual Mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- ===== Unmap Keys ==================================================
keymap("", "<Space>", "", opts)
keymap("", "q", "", opts)
keymap("", "<C-c>", "", opts)
--keymap("", "<C-a>", "", opts)
keymap("", "<C-d>", "", opts)
--keymap("", "<C-x>", "", opts)
keymap("", "<C-u>", "", opts)
keymap("", "<C-z>", "", opts)
--keymap("", "<C-h>", "", opts)
keymap("", "<C-j>", "", opts)
keymap("", "<C-k>", "", opts)
--keymap("", "<C-l>", "", opts)
keymap("", "<C-S-u>", "", opts)
