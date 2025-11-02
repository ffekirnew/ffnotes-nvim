--- @module "ffnotes.commands.constants"

--- @class Constants
--- @field newNotePrompt string
local constants = {
	newNotePrompt = "Enter note name: ",
	newTemplatePrompt = "Enter template name: ",
	telescopeSearchDirs = function(directory)
		return 'Telescope find_files search_dirs={"' .. directory .. '"}'
	end,
}

return constants
