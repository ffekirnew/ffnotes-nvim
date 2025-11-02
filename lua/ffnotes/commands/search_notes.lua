--- @module "ffnotes.commands.search_notes"

local constants = require("ffnotes.commands.constants")

--- @param options Config
--- @return fun(): nil
local searchNotes = function(options)
	return function()
		vim.cmd("tabnew", constants.telescopeSearchDirs(options.notes_dir))
	end
end

return searchNotes
