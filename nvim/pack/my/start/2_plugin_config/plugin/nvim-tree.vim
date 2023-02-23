if !g:enablenvim
	finish
endif

" A File Explorer For Neovim Written In Lua
PackAdd nvim-tree/nvim-tree.lua

" start of lua heredoc
lua << EOF

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 40,
    preserve_window_proportions = true,
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<C-m>", action = "toggle_mark" },
        { key = "m", action = "full_rename" },
      },
    },
  },
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
  renderer = {
    group_empty = true,
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},
		icons = {
			padding = " ",
			show = {
				folder_arrow = false,
			},
			glyphs = {
				git = {
					unstaged = "~",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "#",
					deleted = "✗",
					ignored = "◌",
				},
			},
		},
		special_files = { "Session.vim", "ROADMAP.md", "Makefile", "README.md", "readme.md" },
  },
  filters = {
    dotfiles = true,
  },
})

-- end of lua heredoc
EOF

function! NvimTreeToggleOrFind()
	if !filereadable(expand('%:p')) || &filetype == 'NvimTree'
		:NvimTreeToggle
	else
		:NvimTreeFindFile
	endif
endfunction

nmap <C-n> :NvimTreeToggle<cr>
" nmap <C-n> :call NvimTreeToggleOrFind()<cr>	
