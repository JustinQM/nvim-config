local lspconfig = require('lspconfig')
local coq = require('coq') 

lspconfig.clangd.setup(coq.lsp_ensure_capabilities())
lspconfig.pyright.setup(coq.lsp_ensure_capabilities())

