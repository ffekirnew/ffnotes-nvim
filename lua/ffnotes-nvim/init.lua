local definitions = require("ffnotes-nvim.definitions")
local notes = {}

-- notes_dir is a required option
--- @param _ table
--- @return nil
notes.setup = function(_)
	definitions.createSubDirectories()
end

notes.functions = require("ffnotes-nvim.functions")

return notes
