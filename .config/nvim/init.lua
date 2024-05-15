require('config')

-- the bug with nvim opening without filling the terminal and needing to resize the window to fix 
vim.api.nvim_create_autocmd({"VimEnter"}, {
  callback = function()
    local pid, WINCH = vim.fn.getpid(), vim.loop.constants.SIGWINCH
    vim.defer_fn(function() vim.loop.kill(pid, WINCH) end, 20)
  end
})
