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

