local lsp = require('lsp-zero')
lsp.preset("recommended")

require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = {"lua_ls", "ruff", "ruff_lsp", "pylsp", "markdown_oxide"}
}
require("lspconfig").ruff.setup{}
require("lspconfig").intelephense.setup({})

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>rf', vim.lsp.buf.format, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', '<leader>rr', require('telescope.builtin').registers, {})


    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end


require("lspconfig").lua_ls.setup{
    on_attach = on_attach
}
require("lspconfig").pylsp.setup{
    on_attach = on_attach
}

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})
