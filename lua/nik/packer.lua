local stdpath = vim.fn.stdpath
local fn = vim.fn

if not pcall(require, 'packer') then
	local packer_path = stdpath 'data' ..'/site/pack/packer/start/packer.nvim'
	fn.delete(packer_path, 'rf')

	print('Installing Packer ...')

	fn.system {
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		packer_path,
	}
else
	local file_available, _ = loadfile(stdpath 'data' .. '/packer_compiled.lua')

	if file_available then
		file_available()
	else
		print('Please run :PackerSync')
	end
end
