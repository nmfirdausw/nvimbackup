require('nik.packer')
require('nik.colorscheme')
require('nik.settings')

local exists, impatient = pcall(require, "impatient")
if exists then impatient.enable_profile() end

require('nik.plugins')
require('nik.settings')
require('nik.keymaps')
