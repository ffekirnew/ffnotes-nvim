local utils = {}

--- @return string
utils.getDate = function()
	local now = os.date("*t")

	return now.year .. now.month .. now.day
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
	name = name:gsub("[^%w.%-]", "")

	if not name:match("$.md$") then
		name = name .. ".md"
	end

	return name
end

return utils
