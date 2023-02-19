local status_ok, lp = pcall(require, "nvim-lastplace")
if not status_ok then
  return
end

lp.setup {
    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    lastplace_open_folds = true
}
