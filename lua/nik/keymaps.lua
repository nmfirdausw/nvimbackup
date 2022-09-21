local set = vim.keymap.set

-- Neo-tree File Explorer
set('n', '<leader>e', '<cmd>Neotree reveal<cr>', { desc = 'Focus file Explorer' })
set('n', '<leader>te', '<cmd>Neotree toggle<cr>', { desc = 'File Explorer' })

-- Stay in indent mode
set('v', '<', '<gv', { desc = 'Indent line' })
set('v', '>', '>gv', { desc = 'Unindent line' })
set('n', '<', '<<', { desc = 'Indent line' })
set('n', '>', '>>', { desc = 'Unindent line' })

-- Comment
set('n', '<leader>/', function() require('Comment.api').toggle.linewise.current() end, { desc = 'Comment line' })
set('v', '<leader>/', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = 'Comment line' })

-- Navigate buffers
set('n', 'L', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer tab' })
set('n', 'H', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer tab' })

-- Buffer delete
set('n', '<leader>c', '<cmd>Bdelete<cr>', { desc = "Delete buffer" });

-- Telescope 
set('n', '<leader>ff', function() require("telescope.builtin").find_files() end, { desc = 'Files' })
set('n', '<leader>fw', function() require("telescope.builtin").live_grep() end, { desc = 'Words' })

-- Smart-splits
set('n', '<C-h>', function() require('smart-splits').move_cursor_left() end, { desc = 'Move to left split' })
set('n', '<C-j>', function() require('smart-splits').move_cursor_down() end, { desc = 'Move to left down' })
set('n', '<C-k>', function() require('smart-splits').move_cursor_up() end, { desc = 'Move to left up' })
set('n', '<C-l>', function() require('smart-splits').move_cursor_right() end, { desc = 'Move to left right' })

-- Terminal
set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = 'ToggleTerm float' })
set('n', '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', { desc = 'ToggleTerm horizontal split' })
set('n', '<leader>tv', '<cmd>ToggleTerm size=40 direction=vertical<cr>', { desc = 'ToggleTerm vertical split' })
