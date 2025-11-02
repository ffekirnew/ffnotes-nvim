--- @module "ffnotes.commands.new_template"

local constants = require("ffnotes.commands.constants")
local utils = require("ffnotes.commands.utils")
local ioUtils = require("ffnotes.utils.io")

--- @param options Config
--- @return fun(): nil
local newTemplate = function(options)
	return function()
		local title = vim.fn.input(constants.newTemplatePrompt)

		if title == nil then
			error("Template creation aborted.")
			return
		end

		if ioUtils.file_exists(title) then
			error("Template already exists.")
			return
		end

		local path = options.sub_dirs.templates .. "/" .. utils.normalize(title, false)
		ioUtils.copy_file(options.templates.template, path)

		vim.cmd("tabnew" .. path)
	end
end

return newTemplate
