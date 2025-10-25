local file_utils = {}

local uv = vim.uv

--- @param path string
--- @return boolean
function file_utils.file_exists(path)
	local stat = uv.fs_stat(path)
	return stat ~= nil
end

--- @param path string
--- @param callback function
--- @return nil
function file_utils.create_file(path, callback)
	uv.fs_open(path, "w", 438, function(err, fd)
		if err then
			callback(false, err)
			return
		end
		uv.fs_close(fd, function(close_err)
			if close_err then
				callback(false, close_err)
				return
			end
			callback(true)
		end)
	end)
end

--- @param path string
--- @return nil
function file_utils.create_parent_directories(path)
	local dir = vim.fs.dirname(path)
	if not dir or dir == "" then
		return false, "Invalid path"
	end

	-- Recursively ensure parent directory exists
	local function ensure_dir(target)
		local stat = uv.fs_stat(target)
		if stat then
			return true
		end

		local parent = vim.fs.dirname(target)
		if parent and parent ~= target then
			ensure_dir(parent)
		end

		local ok, mkdir_err = uv.fs_mkdir(target, 493) -- 0755
		if not ok and mkdir_err ~= "EEXIST" then
			return false, mkdir_err
		end
		return true
	end

	return ensure_dir(dir)
end

return file_utils
