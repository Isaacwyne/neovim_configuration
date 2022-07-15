local present, escape = pcall(require, "better_escape")
if not present then
    return
end

local options = {
    mapping = { "jk" },
    time = vim.o.timeoutlen,
    clear_empty_lines = false,              -- clear the line after escaping if there is only whitespace
    keys = "<Esc>",
}

escape.setup(options)