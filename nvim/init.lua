local present, impatient = pcall(require, "impatient")
if present then
    impatient.enable_profile()
end

for _, source in ipairs {
    "core.options",
    "core.mappings",
    "core.plugins",
    
    -- plugin configurations
    "plugins.configs.autopairs",
    "plugins.configs.better_escape",
    "plugins.configs.blankline",
    "plugins.configs.bufferline",
    "plugins.configs.cmp",
    "plugins.configs.colorizer",
    "plugins.configs.comment",
    "plugins.configs.gitsigns",
    "plugins.configs.indentline",
    "plugins.configs.nvimtree",
    "plugins.configs.statusline",
    "plugins.configs.telescope",
} do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
    end
end