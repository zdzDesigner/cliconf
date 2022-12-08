local res, statusline = pcall(require, "lualine")
-- print('statusline::',res)
if not res then return end


local style = {
  bg='None',fg='#aaaaaa',warn='#bbbbbb', 
  mode={bg='None',fg="#bbbbbb"}, 
  branch={bg='None',fg='#aaaaaa'},
  lsp = {bg='None',fg='#aaaaaa'},
  modify={bg='None',fg='#ffffff'}
  -- readonly={bg='None',fg='#ffffff'}
}
-- local style = {
--   bg='#44475a',fg='#aaaaaa',warn='#000000', 
--   mode={bg='#5a4444',fg="#bbbbbb"}, 
--   branch={bg='#44525a',fg='#aaaaaa'},
--   lsp = {bg='#56445a',fg='#aaaaaa'},
--   modify={bg='#000000',fg='#ffffff'}
--   -- readonly={bg='#000000',fg='#ffffff'}
-- }

local modes = {
  ['NORMAL'] = 'NO',
  ['VISUAL'] = 'VI',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['SELECT'] = 'SE',
  ['S-LINE'] = 'SL',
  ['S-BLOCK'] = 'SB',
  ['REPLACE'] = 'RE',
  ['V-REPLACE'] = 'VR',
  ['INSERT'] = 'IN',
  ['COMMAND'] = 'CM',
  ['EX'] = 'EX',
  ['MORE'] = 'MO',
  ['CONFIRM'] = 'CF',
  ['TERMINAL'] = 'TM',
  ['O-PENDING'] = 'PD',
}



local lualine_c = {{function()
      local bg = style.bg -- not modified
      local fg = style.fg -- not modified
      if vim.bo.modified then 
        bg = style.modify.bg -- unsaved
        fg = style.modify.fg -- unsaved
      elseif not 
        vim.bo.modifiable 
      then 
        -- bg = '#a70089' 
      end -- readonly
      vim.cmd('hi! lualine_filename_status guibg='..bg..' guifg='..fg)
      return '%t %m'
    end,
    path = 1,             -- relative path
    shorting_target = 80, -- shorten long paths
    file_status = true,   -- show modified/readonly
    symbols = { 
      modified = '[+]', readonly = '[-]' 
    },
    color = 'lualine_filename_status',
  }}

  local function lsp_name()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return nil
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return nil
  end

  local lsp_tbl = {
    function()
      return lsp_name()
    end,
    cond = function()
      return lsp_name() ~= nil
    end,
    -- icon = ' ',
    -- icon = '慎',
    
    color = style.lsp,
    -- color = { fg = colors.fg, bg = colors.IncSearch },
  }

  statusline.setup({
    -- tabline = {
      --   lualine_a = {'windows'},
      --   -- lualine_a = {'buffers'},
      --   -- lualine_b = {'branch'},
      --   -- lualine_c = {'filename'},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {'tabs'}
      -- },
      options = {
        -- hide_filename_extension = false,
        icons_enabled = false,
        refresh = {
          statusline = 2000,
        },
        theme = 'dracula-nvim',
        component_separators = {left='', right=''},
        section_separators = {left='', right=''},
        disabled_filetypes = {
          'packer',
          'NvimTree',
          'fugitive',
          'fugitiveblame',
        }
      },
      sections = {
        lualine_a = {
          {
            'mode',
            color = style.mode,
            fmt = function(str) 
              if modes[str]~=nil then
                return ' ' .. modes[str]
              end
              return  ' ' .. str
            end
          }
        },
        lualine_b = {
          {
            'branch',
            color = style.branch,
            fmt = function(str) return ' ' .. str end,
          },
        },
        lualine_c = lualine_c,
        lualine_x = {{
          'diagnostics',
          color = style,
          sources = { 'nvim_lsp' },
          -- symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          symbols = { error = 'e.', warn = 'r.', info = 'r.', hint = 'h.' },
          diagnostics_color = {
            color = style,
            error = { fg = style.warn},
            warn  = { fg = style.warn},
            info  = { fg = style.warn},
            hint  = { fg = style.warn},
          },
        }, lsp_tbl},
        lualine_y = { {'fileformat', color = style}, {'encoding',color = style}},
        lualine_z = {{'progress',color = style},{'location',color = style}},
      },
    })
    require('lualine').hide({
      place = {'tabline', 'winbar'}, -- The segment this change applies to.
      unhide = false,  -- whether to reenable lualine again/
    })

