--- @module "ffnotes-nvim.functions.useCases.dailyNote"

local utils = require("ffnotes-nvim.functions.utils")
local file_utils = require("ffnotes-nvim.utils.file")

--- @param options Config
--- @return fun(): nil
local dailyNote = function(options)
	return function()
		local daily_note = utils.getDailyNoteFile()
		local daily_note_path = options.sub_dirs.daily_notes .. "/" .. daily_note

		-- Copy from the default template
		file_utils.copy_file(options.default_templates.daily_note, daily_note_path)

		vim.cmd("tabnew" .. daily_note_path)
	end
end

return dailyNote
