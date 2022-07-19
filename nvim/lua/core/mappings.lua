-- n, v, i are mode names (normal, visual, insert) respectively

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

----- Insert -----
-- press jk fast to esc
keymap("i", "jk", "<ESC>", opts)

-- go to beginning and end of current line
keymap("i", "<C-b>", "<Home>", opts)
keymap("i", "<C-e>", "<End>", opts)

-- navigate within insert mode
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)

----- Normal -----
keymap("n", "<leader>w", "<cmd>w<CR>", opts)                                    -- write/save file
keymap("n", "<C-w>", "<cmd>w!<CR>", opts)                                       -- force write/save file
keymap("n", "<leader>q", "<cmd>q<cr>", opts)                                    -- quit
keymap("n", "<C-q>", "<cmd>q!<cr>", opts)                                       -- force quit
keymap("n", "<leader>x", "<cmd>bdelete<CR>", opts)                              -- close current buffer
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)                           -- toggle NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", opts)                        -- focus NvimTree
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", opts)                               -- turn off highlighting (search)
keymap("n", "<leader>fn", "<cmd>enew<cr>", opts)                                -- create new file

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
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", opts)
-- keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)
-- keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)

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

-- Telescope --
-- find
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>ch", "<cmd>Telescope keymaps<CR>", opts)
-- git
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", opts)
