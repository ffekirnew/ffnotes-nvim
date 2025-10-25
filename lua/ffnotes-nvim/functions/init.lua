local definitions = require("ffnotes-nvim.definitions")
local utils = require("ffnotes-nvim.functions.utils")
local file_utils = require("ffnotes-nvim.utils.file")

local notes_dir = definitions.notes_dir

local functions = {}

--- @return nil
functions.newNoteFromTemplate = function()
	local new_note_name = vim.fn.input("Enter note name to be created from template: ")

	if new_note_name == nil then
		print("Note creation aborted.")
		return
	end

	new_note_name = utils.normalize(new_note_name)
	local new_note_path = notes_dir .. "/" .. definitions.sub_directories.inbox .. "/" .. new_note_name

	-- Check if the new note already exists
	if file_utils.file_exists(new_note_path) then
		print("Note already exists")
		return
	end

	file_utils.create_parent_directories(new_note_path)
	file_utils.create_file(new_note_path, function(success, err)
		if not success then
			print("File was not created: " .. err)
		end
	end)

	-- Open a telescope find_files window to select a template
	local templates_dir = notes_dir .. "/" .. definitions.sub_directories.templates
	vim.cmd("tabnew")
	vim.cmd('Telescope find_files search_dirs={"' .. notes_dir .. '"}')

	-- after selecting a template, read the contents of the file and insert it into the new note
	-- vim.cmd("normal! ggVGy")
	-- vim.cmd.tabnew(new_note_path)
	-- vim.cmd("normal! ggP")
end

--- @return nil
functions.newNote = function()
	local new_note_name = vim.fn.input("Enter note name: ")

	if new_note_name == nil then
		print("Note creation aborted.")
		return
	end

	new_note_name = utils.normalize(new_note_name)
	local new_note_path = notes_dir .. "/" .. definitions.sub_directories.inbox .. "/" .. new_note_name

	vim.cmd("tabnew" .. new_note_path)
end

--- @return nil
functions.dailyNote = function()
	local daily_note_file_name = utils.getDailyNoteFile()
	local daily_note_path = notes_dir .. "/" .. definitions.sub_directories.daily_notes .. "/" .. daily_note_file_name

	vim.cmd("tabnew" .. daily_note_path)
end

--- @return nil
functions.searchNotes = function()
	vim.cmd("tabnew")
	vim.cmd('Telescope find_files search_dirs={"' .. notes_dir .. '"}')
end

return functions
