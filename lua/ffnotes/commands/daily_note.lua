--- @module "ffnotes.commands.daily_note"

local utils = require("ffnotes.commands.utils")
local ioUtils = require("ffnotes.utils.io")

--- @param options Config
--- @return fun(): nil
local dailyNote = function(options)
	return function()
		local title = utils.getDailyNoteFile()
		local path = options.sub_dirs.daily_notes .. "/" .. title

		if not ioUtils.file_exists(path) then
			-- apply init logic
			utils.initNote({
				note = {
					title = title,
					path = path,
					date = utils.getDate("%Y-%m-%d"),
					templatePath = options.templates.daily_note,
				},
			})
		end

		vim.cmd("tabnew" .. path)
	end
end

return dailyNote
