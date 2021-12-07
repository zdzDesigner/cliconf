local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local lastRootPath = nil
local gopath = os.getenv("GOPATH")
if gopath == nil then
    gopath = "/home/zdz/go"
end
local gopathmod = gopath..'/pkg/mod'

lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            allowModfileModifications = true,
            gofumpt = true,
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    -- 解决依赖pak/mod/第三方模块 jump to define 无效 https://github.com/neovim/nvim-lspconfig/issues/804
    root_dir = function(fname)
        local fullpath = vim.fn.expand(fname, ':p')
        if string.find(fullpath, gopathmod) and lastRootPath ~= nil then
            return lastRootPath
        end
        lastRootPath = util.root_pattern("go.mod", ".git")(fname)
        return lastRootPath
    end,
}

function goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    if result[1] == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
        if action.edit then
            vim.lsp.util.apply_workspace_edit(action.edit)
        end
        if type(action.command) == "table" then
            vim.lsp.buf.execute_command(action.command)
        end
    else
        vim.lsp.buf.execute_command(action)
    end
end


vim.cmd([[autocmd BufWritePre *.go lua goimports(1000)]])
vim.cmd([[autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
-- vim.cmd([[autocmd FileType go noremap <C-]> :lua vim.lsp.buf.definition()<CR>]])
-- vim.cmd([[autocmd FileType go noremap gd :lua vim.lsp.buf.definition()<CR>]])
-- vim.cmd([[autocmd FileType go noremap S :lua format()<CR>]])
-- vim.cmd([[autocmd FileType go noremap S :lua vim.lsp.buf.formatting()<CR> :w<CR>]])



