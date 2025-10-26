local definitions = {}

--- @type string
definitions.notes_dir = os.getenv("HOME") .. "/notes"

--- @type table<string, string>
definitions.sub_dirs = {
	daily_notes = definitions.notes_dir .. "/" .. "daily_notes",
	inbox = definitions.notes_dir .. "/" .. "inbox",
	zettlekasten = definitions.notes_dir .. "/" .. "zettelkasten",
	journal = definitions.notes_dir .. "/" .. "journal",
	templates = definitions.notes_dir .. "/" .. "templates",
}

--- @type string
definitions.default_template = definitions.sub_dirs.templates .. "/" .. "default.md"

return definitions
