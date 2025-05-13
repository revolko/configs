require "nvchad.options"
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!


--custom
local opt = vim.opt
opt.nu = true
opt.relativenumber = true
opt.scrolloff = 8
opt.clipboard = ""

require "nvim-treesitter.configs".setup{
  auto_install = true
}

vim.g.rest_nvim = {}

-- disable weird TAB jumping TODO: does not work
autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end
})

-- autocmd("VimEnter", {
--   group = augroup("capslockstuff", { clear = true }),
--   callback = function()
--     vim.cmd("!setxkbmap -option caps:escape")
--   end,
-- })
-- 
-- autocmd("VimLeave", {
--   group = augroup("capslockstuff", { clear = true }),
--   callback = function()
--     vim.cmd("!setxkbmap -option")
--   end,
-- })
