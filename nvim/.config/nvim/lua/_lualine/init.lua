require'lualine'.setup {
	options = {
		theme = 'github',
		section_separators = {'', ''},
		component_separators = {'', ''},
		icons_enabled = 1
	},
	sections = {
		lualine_a = {'mode'},
    lualine_b = {{
			'branch',
			icon = '',
		}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
	}
}

