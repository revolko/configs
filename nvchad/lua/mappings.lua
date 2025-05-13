require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- custom
map("n", "<leader>pv", vim.cmd.Ex)

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<leader>dd", function() vim.diagnostic.open_float() end, { desc = "show line diagnostic"})

-- gitsings
local gitsigns = require("gitsigns")
map('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal({']c', bang = true})
  else
    gitsigns.nav_hunk('next')
  end
end)

map('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal({'[c', bang = true})
  else
    gitsigns.nav_hunk('prev')
  end
end)
map('n', '<leader>gs', gitsigns.stage_hunk, { desc = "GIT stage hunk"})
map('n', '<leader>gr', gitsigns.reset_hunk, { desc = "GIT reset hunk"})
map('n', '<leader>gS', gitsigns.stage_buffer, { desc = "GIT stage buffer"})
map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = "GIT unstage hunk"})
map('n', '<leader>gR', gitsigns.reset_buffer, { desc = "GIT reset buffer"})
map('n', '<leader>gp', gitsigns.preview_hunk, { desc = "GIT preview hunk"})
map('n', '<leader>gb', function() gitsigns.blame_line{full=true} end, { desc = "GIT blame"})
map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "GIT blame line"})
map('n', '<leader>gd', gitsigns.diffthis, { desc = "GIT diff this"})
map('n', '<leader>gD', function() gitsigns.diffthis('~') end, { desc = "GIT diff this at ~"})
map('n', '<leader>td', gitsigns.toggle_deleted, { desc = "GIT toggle delete"})
map('', '<leader>y', '"+y', { desc = "Yank to clipboard"}) -- E.g: <leader>yy will yank current line to os clipboard
map('', '<leader>Y', '"+y$', { desc = "Yank until EOL to clipboard"})
map('n', '<leader>p', '"+p', { desc = "Paste after cursor from clipboard"})
map('n', '<leader>P', '"+P', { desc = "Paste before cursor from clipboard"})
