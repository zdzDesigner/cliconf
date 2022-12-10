```lua
print(vim.inspect(vim.loop.fs_stat(vim.fn.stdpath("data"))))
-- {
--   atime = {
--     nsec = 939057889,
--     sec = 1669866670
--   },
--   birthtime = {
--     nsec = 29364305,
--     sec = 1629689105
--   },
--   blksize = 4096,
--   blocks = 8,
--   ctime = {
--     nsec = 190398413,
--     sec = 1669792357
--   },
--   dev = 66306,
--   flags = 0,
--   gen = 0,
--   gid = 1000,
--   ino = 20450445,
--   mode = 16832,
--   mtime = {
--     nsec = 190398413,
--     sec = 1669792357
--   },
--   nlink = 7,
--   rdev = 0,
--   size = 4096,
--   type = "directory",
--   uid = 1000
-- }


-- print(vim.fn.stdpath("data"))
-- /home/zdz/.local/share/nvim
```



### vim log
```
set verbose=20

>= 1	读写 viminfo 文件时
>= 2	当 ":source" 一个文件时，通常是载入一个配置文件
>= 5	所有搜索到的 tag 文件和 include 文件
>= 8	执行到 autocommands 的文件
>= 9	每次执行到 autocommand 时
>= 12	每次执行到 function 时
>= 13	产生、捕获、结束处理、忽略一个异常时
>= 14	":finally" 语句中等待的所有命令
>= 15	每一个执行到的 Ex 命令（截断到 200 字符）
```
