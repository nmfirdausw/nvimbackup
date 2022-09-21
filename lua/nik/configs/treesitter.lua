require('nvim-treesitter.configs').setup {
  sync_installed = true,
  highlight = {
		enable = true, -- This is a MUST
		additional_vim_regex_highlighting = { 'php' },
  },
  indent = {
		enable = false, -- Really breaks stuff if true
  },
	rainbow = {
    enable = false,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
	autotag = {
		enable = true,
	},
	context_commentstring = {
    enable = true
  }
}
