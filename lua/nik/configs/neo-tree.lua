require('neo-tree').setup({
  close_if_last_window = true,
  enable_diagnostics = true,
	popup_border_style = 'single',
	window = {
		width = 30,
	},
	default_component_configs = {
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '',
      default = '',
    },
    modified = {
      symbol = '●',
    },
    git_status = {
      symbols = {
        added = '',
        deleted = '',
        modified = '',
        renamed = '',
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '',
        conflict = '',
      },
    },
	}
})
