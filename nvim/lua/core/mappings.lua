-- n, v, i are mode names (normal, visual, insert) respectively

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

----- Insert -----
-- press jk fast to esc
keymap("i", "jk", "<ESC>", opts)

----- Normal -----
keymap("n", "<leader>w", "<cmd>w<CR>", opts)                                -- write/save file
keymap("n", "<leader>x", "<cmd>bdelete<CR>", opts)                          -- close current buffer
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)                   -- toggle NvimTree
keymap("n", "<leader>n", "<cmd>NvimTreeFocus<CR>", opts)                    -- focus NvimTree

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with the arrow keys
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- buffer navigation
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

----- Visual -----
-- Stay in visual mode while indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- commenting out a whole line
-- how to create a bufferline
-- how to create a statusline in lua
-- numbering format toggling in lua
-- removing the "~" neovim side
-- changing the theme
-- using and installing a plugin manager
-- adding gitsigns
