--- @module "ffnotes.commands"

--- @return Commands
local commandLookup = {
	FfnotesNewNote = require("ffnotes.commands.new_note"),
	FfnotesDailyNote = require("ffnotes.commands.daily_note"),
	FfnotesSearchNotes = require("ffnotes.commands.search_notes"),
}

return commandLookup
