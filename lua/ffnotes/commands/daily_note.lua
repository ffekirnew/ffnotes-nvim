--- @module "ffnotes.commands.daily_note"

local utils = require("ffnotes.commands.utils")
local fileUtils = require("ffnotes.utils.file")

--- @param options Config
--- @return fun(): nil
local dailyNote = function(options)
	return function()
		local dailyNote = utils.getDailyNoteFile()
		local dailyNotePath = options.sub_dirs.daily_notes .. "/" .. dailyNote

		if not fileUtils.file_exists(dailyNotePath) then
			fileUtils.copy_file(options.default_templates.daily_note, dailyNotePath)
		end

		vim.cmd("tabnew" .. dailyNotePath)
	end
end

return dailyNote
