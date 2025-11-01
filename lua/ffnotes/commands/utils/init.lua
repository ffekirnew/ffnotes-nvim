--- @module "ffnotes.commands.utils"
local utils = {}

--- @return string
utils.getDate = function()
	local now = os.date("*t")

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
	return date .. "-" .. name
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
