--- @module "ffnotes.config"
local config = {}

local definitions = require("ffnotes.defaults")

--- @param opts Config
--- @return Config
config.initialize = function(opts)
	opts = opts or {}

	local notes_dir = opts.notes_dir or definitions.notes_dir

	return {
		notes_dir = notes_dir,
		sub_dirs = {
			daily_notes = notes_dir .. "/" .. definitions.sub_dirs.daily_notes,
			inbox = notes_dir .. "/" .. definitions.sub_dirs.inbox,
			zettlekasten = notes_dir .. "/" .. definitions.sub_dirs.zettlekasten,
			journal = notes_dir .. "/" .. definitions.sub_dirs.journal,
			templates = notes_dir .. "/" .. definitions.sub_dirs.templates,
		},
		default_templates = {
			default = notes_dir
				.. "/"
				.. definitions.sub_dirs.templates
				.. "/"
				.. definitions.default_templates.default,
			daily_note = notes_dir
				.. "/"
				.. definitions.sub_dirs.templates
				.. "/"
				.. definitions.default_templates.daily_note,
		},
	}
end

return config
