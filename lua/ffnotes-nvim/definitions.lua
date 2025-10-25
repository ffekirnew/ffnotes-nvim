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

--- @return nil
definitions.createSubDirectories = function()
	for _, sub_dir in pairs(definitions.sub_directories) do
		os.execute(definitions.notes_dir .. sub_dir)
	end
end

return definitions
