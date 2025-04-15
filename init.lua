local api = vim.api

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.bo.tabstop = 2
vim.bo.autoread = true
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.wo.cursorline = true

local dein_dir = vim.fn.expand('~/.cache/dein')
local dein_repo_dir = dein_dir..'/repos/github.com/Shougo/dein.vim'

vim.o.runtimepath = dein_repo_dir..','..vim.o.runtimepath

-- dein install check
if (vim.fn.isdirectory(dein_repo_dir) == 0) then
  os.execute('git clone https://github.com/Shougo/dein.vim '..dein_repo_dir)
end

-- begin settings
if (vim.fn['dein#load_state'](dein_dir) == 1) then
  local rc_dir = vim.fn.expand('~/.config/nvim')
  local toml = rc_dir..'/dein.toml'
  vim.fn['dein#begin'](dein_dir)
  vim.fn['dein#load_toml'](toml, { lazy = 0 })
  vim.fn['dein#end']()
  vim.fn['dein#save_state']()
end

-- plugin install check
if (vim.fn['dein#check_install']() ~= 0) then
  vim.fn['dein#install']()
end

-- plugin remove check
local removed_plugins = vim.fn['dein#check_clean']()
if vim.fn.len(removed_plugins) > 0 then
  vim.fn.map(removed_plugins, "delete(v:val, 'rf')")
  vim.fn['dein#recache_runtimepath']()
end

-- devicons

-- fern settings 

-- show hidden files
vim.cmd[[let g:fern#default_hidden = 1]]

-- toggle Fern by :Fe
vim.api.nvim_create_user_command(
  'Fe',
  function()
    vim.cmd(":Fern . -reveal=% -drawer -toggle -width=45<CR>")
    end,
    {nargs = 0}
    )
