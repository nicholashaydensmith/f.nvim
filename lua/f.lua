local api = vim.api

local M = {}

M.buf = -1
M.win = -1
M.job = -1

function M.f()
  local from = api.nvim_get_current_win()

  if api.nvim_win_is_valid(M.win) and M.buf == api.nvim_win_get_buf(M.win) then
    api.nvim_set_current_win(M.win)
  else
    vim.cmd('botright split')
    M.win = api.nvim_get_current_win()
  end

  M.buf = api.nvim_create_buf(false, true)
  api.nvim_win_set_buf(M.win, M.buf)

  vim.fn.jobstop(M.job)
  M.job = vim.fn.termopen({vim.g.f_command}, {
    detach = 1,
  })

  api.nvim_set_current_win(from)
end

return M
