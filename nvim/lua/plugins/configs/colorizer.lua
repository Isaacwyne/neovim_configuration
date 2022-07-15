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

        mode = "background",
    },
}

colorizer.setup(options["filetypes"], options["default_options"])