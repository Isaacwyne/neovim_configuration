-- n, v, i are mode names (normal, visual, insert) respectively

local M = {}
print("hello, am working!")

M.general = {
    i = {
        ["<leader>w"] = {"<cmd>w<cr>", "Save"}
    }
}

return M