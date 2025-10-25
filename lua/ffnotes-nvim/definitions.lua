local definitions = {}

--- @type string
definitions.notes_dir = "~/notes"

--- @type table<string, string>
definitions.sub_directories = {
	daily_notes = "/daily_notes",
	inbox = "/inbox",
	zettlekasten = "/zettelkasten",
	journal = "/journal",
	templates = "/templates",
}

local fn = vim.fn
for _, sub_dir in pairs(definitions.sub_directories) do
	fn.execute("mkdir -p " .. definitions.notes_dir .. sub_dir, "silent!")
end

return definitions
