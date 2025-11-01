--- @module "ffnotes-nvim.functions.functions.init"

local newNote = require("ffnotes-nvim.functions.newNote")
local dailyNote = require("ffnotes-nvim.functions.dailyNote")
local searchNotes = require("ffnotes-nvim.functions.searchNotes")

local functions = {}

--- @param options Config
--- @return Functions
functions.initialize = function(options)
	return {
		newNote = newNote(options),
		dailyNote = dailyNote(options),
		searchNotes = searchNotes(options),
	}
end

return functions
