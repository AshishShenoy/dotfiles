local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

configs.setup {
	ensure_installed = {
		'python',
		'cpp',
		'lua',
		'c',
		'rust',
		'go',
		'javascript',
		'typescript',
		'bash',
		'dockerfile',
		'json',
		'css',
		'tsx',
		'toml',
		'yaml',
		'haskell',
	},
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { '' }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { '' }, -- list of language that will be disabled
	},
	indent = { enable = true, disable = { 'yaml', 'python', 'css' } },
}
