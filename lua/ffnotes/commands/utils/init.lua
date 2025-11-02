--- @module "ffnotes.commands.utils"
local fileUtils = require("ffnotes.utils.file")

local utils = {}

--- @param format string | nil
--- @return string
utils.getDate = function(format)
	local now = os.date(format or "*t")
	if format ~= nil then
		return tostring(now)
	end

	--- @return string
	local addLeadingZero = function()
		if string.len(now.day) == 1 then
			return "0"
		else
			return ""
		end
	end

	return now.year .. now.month .. addLeadingZero() .. now.day
end

--- @class InitNoteConfig
--- @field note Note
---
--- @param config InitNoteConfig
--- @return nil
utils.initNote = function(config)
	if config.note.templatePath then
		fileUtils.copy_file(config.note.templatePath, config.note.path)
	end

	local from = { "title", "date" }
	local to = { config.note.title, utils.getDate("%Y-%m-%d") }
	fileUtils.find_and_replace(config.note.path, from, to)
end

--- @return string
utils.getDailyNoteFile = function()
	local date = utils.getDate()

	return date .. ".md"
end

--- @param name string
--- @return string
utils.normalize = function(name)
	name = name:gsub("$s+", "_")
	name = name:gsub("[^%w.%-]", "_")

	if not name:match("$.md$") then
		name = name .. ".md"
	end

	local date = utils.getDate()
	return date .. "-" .. string.lower(name)
end

--- @param path string
--- @return nil
utils.getParentDirectory = function(path)
	return path:match("(.*/)")
end

--- @param path string
--- @return string
utils.getFileName = function(path)
	return path:match("([^/]*)$")
end

return utils
