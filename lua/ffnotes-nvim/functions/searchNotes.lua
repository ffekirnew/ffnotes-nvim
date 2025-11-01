--- @module "ffnotes-nvim.functions.useCases.searchNotes"

--- @param options Config
--- @return fun(): nil
local searchNotes = function(options)
	return function()
		local search_dirs = { options.sub_dirs.inbox, options.sub_dirs.daily_notes }

		vim.cmd("tabnew")
		vim.cmd('Telescope find_files search_dirs={"' .. search_dirs .. '"}')
	end
end

return searchNotes
