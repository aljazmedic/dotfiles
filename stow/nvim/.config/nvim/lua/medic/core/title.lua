function _G.current_tab()
  local curr_buf = vim.fn.bufnr()
  local total = 0
  local curr_tab

  for i = 1, vim.fn.tabpagenr('$') do
    total = total + 1
    for _, bufnr in ipairs(vim.fn.tabpagebuflist(i)) do
      if bufnr == curr_buf then
        curr_tab = i
      end
    end
  end

  return string.format('(%d of %d)', curr_tab, total)
end

vim.opt.titlestring = [[%f %h%m%r%w - %{v:progname} %{luaeval('current_tab()')}]]
