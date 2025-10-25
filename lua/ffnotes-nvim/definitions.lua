local lfs = require("lfs")
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
	local full_path = ""
	for dir in string.gmatch(path, "[^/]+") do
		full_path = full_path .. "/" .. dir
		local attr = lfs.attributes(full_path)
		if not attr then
			lfs.mkdir(full_path)
		elseif attr.mode ~= "directory" then
			error(full_path .. " exists but is not a directory")
		end
	end
end

--- @return nil
definitions.createSubDirectories = function()
	for _, sub_dir in pairs(definitions.sub_directories) do
		mkdir_p(definitions.notes_dir .. sub_dir)
	end
end

return definitions
