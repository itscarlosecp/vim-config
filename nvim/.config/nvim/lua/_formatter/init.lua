local function prettier()
  return {
    exe = 'prettierd',
    args = {
      vim.api.nvim_buf_get_name(0),
			'--print-width 80',
			'--tab-width 2',
			'--use-tabs',
			'--no-semi',
    },
    stdin = true
  }
end

local function gofmt()
	return {
		exe = 'gofmt',
		args = {vim.api.nvim_buf_get_name(0)},
		stdin = true
	}
end

require 'formatter'.setup {
  logging = false,
  filetype = {
    css = {prettier},
    html = {prettier},
    javascript = {prettier},
    javascriptreact = {prettier},
		go = {gofmt},
    typescript = {prettier},
    typescriptreact = {prettier},
  }
}

