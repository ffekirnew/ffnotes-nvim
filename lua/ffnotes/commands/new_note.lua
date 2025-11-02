--- @module "ffnotes.commands.new_note"

local constants = require("ffnotes.commands.constants")
local utils = require("ffnotes.commands.utils")
local fileUtils = require("ffnotes.utils.file")

--- @param options Config
--- @return fun(): nil
local newNote = function(options)
	return function()
		local title = vim.fn.input(constants.newNotePrompt)

		if title == nil then
			error("Note creation aborted.")
			return
		end

		local path = options.sub_dirs.inbox .. "/" .. utils.normalize(title)
		if not fileUtils.file_exists(path) then
			-- apply init logic
			utils.initNote({
				note = {
					title = title,
					path = path,
					date = utils.getDate("%Y-%m-%d"),
					templatePath = options.default_templates.default,
				},
			})
		end

		vim.cmd("tabnew" .. path)
	end
end

return newNote
