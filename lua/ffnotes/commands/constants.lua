--- @module "ffnotes.commands.constants"

--- @class Constants
--- @field newNotePrompt string
local constants = {
	newNotePrompt = "What should we call the note?",
	newTemplatePrompt = "What should we call the template?",
	chooseTemplatePrompt = "Choose from your templates:",
	telescopeSearchDirs = function(directory)
		return 'Telescope live_grep search_dirs={"' .. directory .. '"}'
	end,
}

return constants
