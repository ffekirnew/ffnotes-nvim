--- @module "ffnotes.commands.new_note"

local utils = require("ffnotes.commands.utils")
local fileUtils = require("ffnotes.utils.file")

--- @return string | nil
local function newNoteInit()
	local newNoteName = vim.fn.input("Enter note name: ")

	if newNoteName == nil then
		print("Note creation aborted.")
		return
	end

	return utils.normalize(newNoteName)
end

--- @param options Config
--- @return fun(): nil
local newNote = function(options)
	return function()
		local newNotePath = options.sub_dirs.inbox .. "/" .. newNoteInit()

		-- copy from the default template
		fileUtils.copy_file(options.default_templates.default, newNotePath)

		vim.cmd("tabnew" .. newNotePath)
	end
end

return newNote
