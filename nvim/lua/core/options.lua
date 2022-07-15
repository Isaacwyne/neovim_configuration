local opt = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd

local options = {
    fileencoding = "utf-8",                         -- file content encoding for the buffer
    
    laststatus = 3,                                 -- global statusline
    showmode = false,                               -- disable showing modes in commandline
    lazyredraw = true,                              -- lazily redraw the screen

    title = true,                                   -- always show titlestring
    clipboard = "unnamedplus",                      -- connection to the system  clipboard
    cul = true,                                     -- cursorline

    --  Indentline
    expandtab = true,                               -- enable the use of spaces instead of tabs
    shiftwidth = 2,                                 -- number of spaces inserted for indentation
    smartindent = true,                             -- enable smart indentation
    copyindent = true,                              -- copy the previous indentation on autoindenting
    preserveindent = true,                          -- preserve indent structure as much as possible

    ignorecase = true,                              -- case insensitive searching
    smartcase = true,                               -- case sensitive searching
    mouse = "a",                                    -- enable mouse support
    pumheight = 10,                                 -- height of the popup menu

    -- Numbers
    number = true,                                  -- show numberline
    relativenumber = true,                          -- use relative numbering
    numberwidth = 2,                                -- numberline width
    ruler = false,                                  -- disable currentline underlining

    signcolumn = "yes",                             -- always show the sign column
    splitbelow = true,                              -- splitting a new window below the current one
    splitright = true,                              -- splitting a new window to the right of the current one
    tabstop = 8,                                    -- maximum number of tabs
    termguicolors = true,                           -- enable 24-bit RGB color in the TUI
    timeoutlen = 400,                               -- length of time to wait for a mapped sequence
    undofile = true,                                -- enable persistent undo
    
    -- interval for writing swap file to disk, also used by gitsigns
    updatetime = 250,
}

-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1
g.mapleader = " "
g.maplocalleader = " "

opt.shortmess:append "sI"                           -- disable nvim intro screen

-- colorscheme configuration (tokyonight)
g.tokyonight_style = "storm"
g.tokyonight_italic_functions = true
g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- change the "hint" color to "orange" color, and make the "error" color bright red
g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- relative and absolute numbering depending on the current mode(i & n)
vim.cmd [[
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber

  colorscheme tokyonight

  " disable language providers
  let g:loaded_perl_provider = 0
  let g:loaded_ruby_provider = 0
]]

-- go to previous/next line with h,l,left,right arrows
-- when cursor reaches end/beginning of the line
opt.whichwrap:append "<>[]hl"

local default_plugins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfilePlugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for key, value in pairs(options) do
    opt[key] = value
end

for _, plugin in pairs(default_plugins) do
    g["loaded_" .. plugin] = 1
end

-- Don't auto comment new lines
autocmd("BufEnter", {
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o"
})
