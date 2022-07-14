local g = vim.g
local present, indent_blankline = pcall(require, "indent_blankline")
if not present then
	return
end

g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
}
g.indentLine_enabled = 1
-- vim.g.indent_blankline_char = "│"
g.indent_blankline_char = "▏"
-- vim.g.indent_blankline_char = "▎"
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_current_context = true
g.indent_blankline_context_patterns = {
	"class",
	"return",
	"function",
	"method",
	"^if",
	"^while",
	"jsx_element",
	"^for",
	"^object",
	"^table",
	"block",
	"arguments",
	"if_statement",
	"else_clause",
	"jsx_element",
	"jsx_self_closing_element",
	"try_statement",
	"catch_clause",
	"import_statement",
	"operation_type",
}
vim.wo.colorcolumn = "99999"

indent_blankline.setup({
	show_current_context = true,
})
