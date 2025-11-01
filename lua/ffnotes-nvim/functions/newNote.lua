--- @module "ffnotes-nvim.functions.useCases.newNote"

local utils = require("ffnotes-nvim.functions.utils")
local file_utils = require("ffnotes-nvim.utils.file")

--- @param options Config
--- @return fun(): nil
local newNote = function(options)
	return function()
		local new_note_path = options.sub_dirs.inbox .. "/" .. utils.newNoteInit()

		-- copy from the default template
		file_utils.copy_file(options.default_templates.default, new_note_path)

		vim.cmd("tabnew" .. new_note_path)
	end
end

return newNote
