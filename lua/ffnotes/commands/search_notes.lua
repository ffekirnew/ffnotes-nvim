--- @module "ffnotes.commands.search_notes"

--- @param options Config
--- @return fun(): nil
local searchNotes = function(options)
	return function()
		vim.cmd("tabnew")
		vim.cmd('Telescope find_files search_dirs={"' .. options.notes_dir .. '"}')
	end
end

return searchNotes
