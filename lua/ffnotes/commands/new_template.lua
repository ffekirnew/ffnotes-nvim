--- @module "ffnotes.commands.new_template"

local constants = require("ffnotes.commands.constants")
local utils = require("ffnotes.commands.utils")
local fileUtils = require("ffnotes.utils.file")

--- @param options Config
--- @return fun(): nil
local newTemplate = function(options)
	return function()
		local title = vim.fn.input(constants.newTemplatePrompt)

		if title == nil then
			error("Template creation aborted.")
			return
		end

		local path = options.sub_dirs.templates .. "/" .. utils.normalize(title, false)
		if not fileUtils.file_exists(path) then
			-- apply init logic
			utils.initTemplate({
				note = {
					title = title,
					path = path,
					date = utils.getDate("%Y-%m-%d"),
					templatePath = options.templates.template,
				},
			})
		end

		vim.cmd("tabnew" .. path)
	end
end

return newTemplate
