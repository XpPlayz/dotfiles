require("nvchad.configs.lspconfig").defaults()

-- read :h vim.lsp.config for changing options of lsp servers 
local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  bashls = {},

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)  -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end

