local remap = require('utils').remap

-- w!! to save with sudo
remap('c', 'wp', "<esc>:lua require('utils').sudo_write()<CR>", { silent = true })
