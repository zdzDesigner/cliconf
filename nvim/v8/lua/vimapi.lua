
-- print(vim.loop.fs_stat('/home/zdz/.config/nvim/plugin/packer_compiled.lua'))

local vimscript = vim.api.nvim_exec
local function import(module)
  package.loaded[module] = nil
  return require(module)
end

local util = import('util')
print('util:',util)
-- print('util.write_file:',util.write_file)
-- util.write_file('/tmp/ccc', 'ccccc')

-- vim.o.tabline = 'ranger'
print('expand:%:',vim.fn.expand('%')) -- 文件名
print('expand:(%:p):',vim.fn.expand('%:p'))-- 路径+文件名
print('isdirectory:',vim.fn.isdirectory(vim.fn.expand('%')))
print('filereadable:',vim.fn.filereadable)
print('readfile:',vim.fn.readfile)


print('filereadable:',vim.fn.filereadable(vim.fn.expand('/home/zdz/temp/aaa.md')))
print('filereadable:',vim.fn.filereadable(vim.fn.expand('/home/zdz/temp')))
-- 更改 /home/zdz/Application/neovim/nvim v6 -> v8 , 测试chansend ,termopen接口
-- /home/zdz/.zdz/ranger/rifle.conf
-- metatable 无法打印
print('vim.fn:======start=======')
for k,_ in pairs(util) do
  print(k)
end
print('vim.fn:======end=======')

-- tabline 设置文件名
-- util.write_file('/tmp/xxx', vim.inspect(vim.o.tabline))
-- local cmd = 'sh '..os.getenv('CLIENV')..'/nvim/v8/vim/plugins/ranger.sh'
-- local cmd = 'ranger'..'--choosefiles='..filepath..' '..current_path

-- util.write_file('/tmp/xxx', 'cccdddfff')
-- vimscript(':tab drop /home/zdz/.zdz/nvim/v8/init.lua', true)
-- util.sleep(1)
-- vim.o.tabline = 'exitxx'
-- util.sleep(3)
-- local files = vim.loop.fs_read(fd,stat.size)
-- vimscript(':tab drop '..files, true)
