local api = vim.api
local M = {}
function M.makeScratch()
  api.nvim_command('enew') -- equivalent to :enew
  -- vim.bo[0].buftype=nofile -- set the current buffer's (buffer 0) buftype to nofile
  -- vim.bo[0].bufhidden=hide
  -- vim.bo[0].swapfile=false
end


-- print all
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

dump({1, 2, 3})

-- Data types are converted correctly
print(vim.api.nvim_eval('1 + 1')) -- 2
print(vim.api.nvim_eval('[1, 2, 3]')) -- { 1, 2, 3 }
print(vim.inspect(vim.api.nvim_eval('[1, 2, 3]'))) -- { 1, 2, 3 }
print(vim.inspect(vim.api.nvim_eval('{"foo": "bar", "baz": "qux"}'))) -- { baz = "qux", foo = "bar" }
print(vim.api.nvim_eval('v:true')) -- true
print(vim.api.nvim_eval('v:null')) -- nil


vim.g.some_global_variable = {
    key1 = 'value',
    key2 = 300
}

print(vim.inspect(vim.g.some_global_variable)) -- { key1 = "value", key2 = 300 }


return M

