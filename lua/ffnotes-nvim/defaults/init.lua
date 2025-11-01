--- @module "ffnotes-nvim.defaults"
local defaults = {}

--- @type string
defaults.notes_dir = os.getenv("HOME") .. "/notes"

--- @type table<string, string>
defaults.sub_dirs = {
	daily_notes = "daily_notes",
	inbox = "inbox",
	zettlekasten = "zettelkasten",
	journal = "journal",
	templates = "templates",
}

--- @type table<string, string>
defaults.default_templates = {
	default = "default.md",
	daily_note = "daily_note.md",
}

--- @type Config
return defaults
