local G = {}
G.version = 'v10'

G.g = vim.g
G.b = vim.b
G.o = vim.o
G.v = vim.v
G.fn = vim.fn
G.api = vim.api
G.opt = vim.opt

function G.import(module)
  package.loaded[module] = nil
  vim.opt.rtp:prepend('/home/zdz/.zdz/nvim/' .. G.version)
  return require(module)
end

function G.map(maps)
  for _, map in pairs(maps) do
    vim.keymap.set(map[1], map[2], map[3], map[4])
  end
end

function G.set(maps)
  for k, v in pairs(maps) do
    vim.opt[k] = v
  end
end

function G.hi(hls)
  local colormode = G.o.termguicolors and '' or 'cterm'
  for group, color in pairs(hls) do
    local opt = {}
    if color.fg then opt[colormode .. 'fg'] = color.fg end
    if color.bg then opt[colormode .. 'bg'] = color.bg end
    if color.italic then opt.italic = true end
    if color.bold then opt.bold = true end
    if color.underline then opt.underline = true end
    G.api.nvim_set_hl(0, group, opt)
  end
end

function G.cmd(cmd)
  G.api.nvim_command(cmd)
end

function G.exec(c)
  G.api.nvim_exec(c)
end

function G.eval(c)
  return G.api.nvim_eval(c)
end

function G.setup()
  vim.o.exrc = true
  vim.o.secure = true

  vim.opt.termguicolors = true

  -- 运行路径和包路径都要设置, lua 包路径/home/zdz/.config/nvim
  -- vim.opt.packpath:prepend('/home/zdz/.config/nvim/v10') -- 插件模块
  -- vim.opt.rtp:prepend('/home/zdz/.config/nvim/v10')


  -- vim.opt.packpath:prepend('/home/zdz/.zdz/nvim/v10') -- 自定义配置模块
  -- vim.opt.rtp:prepend('/home/zdz/.zdz/nvim/v10')
  -- 清除jumps ctrl-o
  vim.api.nvim_create_autocmd("VimEnter", { callback = function() vim.cmd.clearjumps() end })
end

return G
