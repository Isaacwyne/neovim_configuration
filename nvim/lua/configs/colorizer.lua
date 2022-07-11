local present, colorizer = pcall(require, "colorizer")
if not present then
	return
end

local options = {
  filetypes = {
    "*",
  },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    names = false,
    RRGGBBAA = false,
    rgb_fn = false,
    hsl_fn = false,
    css = false,
    css_fn = false,

    -- available modes: foreground, background
    mode = "background",        -- set the display mode
  },
  colorizer.setup(filetypes, user_default_options)
}
