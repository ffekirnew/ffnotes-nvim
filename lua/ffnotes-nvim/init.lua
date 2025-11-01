local ffnotes = {}

local config = require("ffnotes-nvim.config")
local functions = require("ffnotes-nvim.functions")

--- @param opts Config
--- @return nil
ffnotes.setup = function(opts)
	local options = config.initialize(opts)

	ffnotes.functions = functions.initialize(options)
end

return ffnotes
