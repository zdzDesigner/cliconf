
-- print(vim.inspect(package.loaded))
function ZPackage()
    print('ZPackage::')
    local f = io.open('/home/zdz/.zdz/api/package', 'a')
    f:write(vim.inspect(package.loaded))
    f:close()
end

function ZFormat()
    vim.lsp.buf.formatting()
end
return {
    ZPackage = ZPackage,
    ZFormat = ZFormat
}
