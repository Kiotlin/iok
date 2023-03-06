-- set to 1, nvim will open the preview window after entering the markdown buffer
vim.g.mkdp_auto_start = 0
-- set to 1, the nvim will auto close current preview window when change
vim.g.mkdp_auto_close = 0
-- default 0 is auto refresh markdown as you edit or move the cursor
vim.g.mkdp_refresh_slow = 0
-- set to 1, preview server available to others in your network
vim.g.mkdp_open_to_the_world = 0
-- set to 1, echo preview page url in command line when open preview page
vim.g.mkdp_echo_preview_url = 1
-- a custom vim function name to open preview page this function will receive url as param
vim.g.mkdp_browserfunc = ""
-- options for markdown render
vim.g.mkdp_preview_options = {
  mkit = {},
  katex = {},
  uml = {},
  maid = {},
  disable_sync_scroll = 0,
  sync_scroll_type = 'middle',
  hide_yaml_meta = 1,
  sequence_diagrams = {},
  flowchart_diagrams = {},
  content_editable = false,
  disable_filename = 0,
  toc = {}
}
-- use a customized markdown style
vim.g.mkdp_markdown_css = ""
-- use a customized highlight style
vim.g.mkdp_highlight_css = ""
-- use a custom port to start server or empty for randomseed
vim.g.mkdp_port = ""
-- preview page title, ${name} will be replace with the file name
vim.g.mkdp_page_title = "「${name}」"
-- these filetypes will have MarkdownPreview... commands
vim.g.mkdp_filetypes = { "markdown" }
