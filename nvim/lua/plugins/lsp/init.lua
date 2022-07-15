local present, _ = pcall(require, "lspconfig")
if not present then
  return
end

require"plugins.lsp.configs"
require("plugins.lsp.handlers").setup()
require"plugins.lsp.null-ls"
