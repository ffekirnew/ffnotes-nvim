local debugging = {}

--- @param name string
--- @param value any
--- @return nil
debugging.log = function(name, value)
	print(name .. ": " .. vim.inspect(value))
end

--- @param object any
--- @return string
debugging.dump = function(object)
	local function dump(o)
		if type(o) == "table" then
			local s = "{ "
			for k, v in pairs(o) do
				if type(k) ~= "number" then
					k = '"' .. k .. '"'
				end
				s = s .. "[" .. k .. "] = " .. dump(v) .. ","
			end
			return s .. "} "
		else
			return tostring(o)
		end
	end

	return dump(object)
end

return debugging
