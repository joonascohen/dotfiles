local lspconfig = require("lspconfig")

-- omnisharp setup
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/joonas/repos/omnisharp-roslyn"


lspconfig.sumneko_lua.setup{
    settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
    on_attach = function ()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer= 0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer= 0})
    end,
}
lspconfig.tsserver.setup{
    on_attach = function ()
        print('tsserver LSP is attached')
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer= 0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer= 0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer= 0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer= 0})
        vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer= 0})
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer= 0})
    end,
}
lspconfig.html.setup{
        on_attach = function ()
        print('HTML LSP is attached')
    end,
}
-- lspconfig.omnisharp.setup{
--     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
--     on_attach = function ()
--         print('omnisharp is attached')
--     end
-- }
lspconfig.csharp_ls.setup{
    on_attach = function ()
        print("csharp_ls is attached")
    end
}
