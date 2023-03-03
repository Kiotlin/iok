local status_ok, as = pcall(require, "auto-session")
if not status_ok then
  return
end

as.setup({
  log_level = 'error',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = { "~/", },
  auto_session_use_git_branch = true,
  -- the configs below are lua only
  bypass_session_save_file_types = nil
})

local sl = require("session-lens")

sl.setup {
  path_display = {'shorten'},
  theme = 'dropdown', -- default is dropdown
  theme_conf = { border = true },
  previewer = false,
}

