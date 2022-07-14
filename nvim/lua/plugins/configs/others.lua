local plugin = {}

plugin.indentline = function()
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
end

-- configuration for autopairs
plugin.autopairs = function()
  local present, npairs = pcall(require, "nvim-autopairs")
  if not present then
    return
  end

  npairs.setup {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,               -- offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local cmp_present, cmp = pcall(require, "cmp")
  if not cmp_present then
    return
  end
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_cgar = { tex = "" } })
end

-- better insert mode escape
plugin.better_escape = function()
  local present, escape = pcall(require, "better_escape")
  if not present then
    return
  end

  local options = {
    mapping = { "jk" },
    time = vim.o.timeoutlen,
    clear_empty_lines = false,                  -- clear line after escaping if there is only whitespace
    keys = "<Esc>",
  }

  escape.setup(options)
end

-- indent_blankline
plugin.blankline = function()
  local present, blankline = pcall(require, "indent_blankline")
  if not present then
    return
  end

  local options = {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "lsp-installer",
      "",
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
  }

  blankline.setup(options)
end

plugin.colorizer = function()
  local present, colorizer = pcall(require, "colorizer")
  if not present then
    return
  end

  local options = {
    filetypes = {
      "*"
    },
    default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = false,
      rgb_fn = false,
      hsl_fn = false,
      css = false,
      css_fn = false,

      -- available modes: foreground, background
      mode = "background",              -- set the display mode
    },
    colorizer.setup(filetypes, default_options)
  }
end

plugin.comment = function()
  local present, comment = pcall(require, "Comment")
  if not present then
    return
  end

  comment.setup {
    pre_hook = function(ctx)
      local U = require "Comment.utils"

      local location = nil
      if ctx.ctype == U.ctype.block then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end
      return require("ts_context_commentstring.internal").calculate_commentstring {
        key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
        location = location,
      }
    end,
  }
end

plugin.gitsigns = function()
  local present, gitsigns = pcall(require, "gitsigns")

  if not present then
    return
  end

  local options = {
    signs = {
      add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
      change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
      delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
      changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
    },
  }

  gitsigns.setup(options)
end

return plugin
