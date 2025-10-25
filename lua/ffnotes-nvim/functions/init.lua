local definitions = require("ffnotes-nvim.definitions")
local utils = require("ffnotes-nvim.functions.utils")

local workdir_path = definitions.notes_dir

local functions = {}

--- @return nil
functions.newNote = function()
	local new_note_name = vim.fn.input("Enter note name: ")

	if new_note_name == nil then
		print("Note creation aborted.")
		return
	end

	new_note_name = utils.normalize(new_note_name)

	local new_note_path = workdir_path .. "/" .. definitions.sub_directories.inbox .. "/" .. new_note_name

	vim.cmd("tabnew" .. new_note_path)
end

return functions
