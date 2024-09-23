return {
  "terryma/vim-multiple-cursors",
  enabled = false,
  lazy = false,
  init = function()
    vim.cmd("set selection=inclusive")
    vim.cmd("let g:multi_cursor_start_word_key      = '<C-d>'")
    vim.cmd("let g:multi_cursor_select_all_word_key = '<A-d>'")
    vim.cmd("let g:multi_cursor_start_key           = 'g<C-d>'")
    vim.cmd("let g:multi_cursor_select_all_key      = 'g<A-d>'")
    vim.cmd("let g:multi_cursor_next_key            = '<C-d>'")
  end,
}
