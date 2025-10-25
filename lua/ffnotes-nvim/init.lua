local definitions = require("ffnotes-nvim.definitions")
local notes = {}

-- notes_dir is a required option
--- @param opts table
--- @return nil
--- @usage require("ffnotes-nvim").setup({ notes_dir = "~/notes" })
notes.setup = function(opts)
	if opts == nil then
		opts = {}
		return
	end

	definitions.notes_dir = opts.notes_dir

	definitions.createSubDirectories()
end

notes.functions = require("ffnotes-nvim.functions")

return notes
