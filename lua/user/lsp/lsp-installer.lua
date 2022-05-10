require("nvim-lsp-installer").setup {
    ensure_installed = {"rust_analyzer", "sumneko_lua", "pyright", "clangd"},
    capabilities = require("user.lsp.handlers").capabilities,
    automatic_installation = true,
}
local lspconfig = require("lspconfig")

local on_attach = require("user.lsp.handlers").on_attach

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}

