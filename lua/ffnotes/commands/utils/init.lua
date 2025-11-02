--- @module "ffnotes.commands.utils"
local ioUtils = require("ffnotes.utils.io")

local utils = {}

--- @param templatePath string
--- @return string
utils.getTemplates = function(templatePath)
	return ioUtils.list_files(templatePath)
end

--- @param t string[]
--- @param separator string
--- @return string
utils.joinString = function(t, separator)
	local s = ""
	for i, v in ipairs(t) do
		if i ~= 1 then
			s = s .. separator
		end
		s = s .. v
	end
	return s
end

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
		ioUtils.copy_file(config.note.templatePath, config.note.path)
	end

	local from = { "title", "date" }
	local to = { config.note.title, utils.getDate("%Y-%m-%d") }
	ioUtils.find_and_replace(config.note.path, from, to)
end

--- @return string
utils.getDailyNoteFile = function()
	local date = utils.getDate()

	return date .. ".md"
end

--- @param name string
--- @param addDate boolean
--- @return string
utils.normalize = function(name, addDate)
	addDate = addDate or true

	name = name:gsub("$s+", "_")
	name = name:gsub("[^%w.%-]", "_")

	if not name:match("$.md$") then
		name = name .. ".md"
	end

	if addDate then
		return utils.getDate() .. "-" .. string.lower(name)
	else
		return string.lower(name)
	end
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
