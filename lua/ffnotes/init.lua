--- @module "ffnotes"
local ffnotes = {}

local config = require("ffnotes.config")
local commands = require("ffnotes.commands")

ffnotes.commands = {}

--- @param name string
--- @param func function
--- @param commandConfig  vim.api.keyset.user_command
ffnotes.registerCommand = function(name, func, commandConfig)
	ffnotes.commands[name] = func
	vim.api.nvim_create_user_command(name, func, commandConfig)
end

--- @param opts Config
--- @return nil
ffnotes.setup = function(opts)
	local global_config = config.initialize(opts)

	local newNote = require(commands.FfnotesNewNote)(global_config)
	ffnotes.registerCommand("FfnotesNewNote", newNote, { nargs = 0, desc = "Create a new note" })

	local dailyNote = require(commands.FfnotesDailyNote)(global_config)
	ffnotes.registerCommand("FfnotesDailyNote", dailyNote, { nargs = 0, desc = "Create a new daily note" })

	local searchNotes = require(commands.FfnotesSearchNotes)(global_config)
	ffnotes.registerCommand("FfnotesSearchNotes", searchNotes, { nargs = 0, desc = "Search notes" })

	local newNoteFromTemplate = require(commands.FfnotesNewNoteFromTemplate)(global_config)
	ffnotes.registerCommand(
		"FfnotesNewNoteFromTemplate",
		newNoteFromTemplate,
		{ nargs = 0, desc = "Create a new note from a template" }
	)
	local newTemplate = require(commands.FfnotesNewTemplate)(global_config)
	ffnotes.registerCommand("FfnotesNewTemplate", newTemplate, { nargs = 0, desc = "Create a new template" })
end

return ffnotes
