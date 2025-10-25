local definitions = {}

--- @type string
definitions.notes_dir = os.getenv("HOME") .. "/notes"

--- @type table<string, string>
definitions.sub_directories = {
	daily_notes = "/daily_notes",
	inbox = "/inbox",
	zettlekasten = "/zettelkasten",
	journal = "/journal",
	templates = "/templates",
}

--- @param path string
local function mkdir_p(path)
	os.execute("mkdir -p " .. path)
end

--- @return nil
definitions.createSubDirectories = function()
	for _, sub_dir in pairs(definitions.sub_directories) do
		mkdir_p(definitions.notes_dir .. sub_dir)
	end
end

return definitions
