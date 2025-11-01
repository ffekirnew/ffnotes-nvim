--- @module "ffnotes"
local ffnotes = {}

local config = require("ffnotes.config")
local commands = require("ffnotes.commands")

--- @param opts Config
--- @return nil
ffnotes.setup = function(opts)
	local command_config = config.initialize(opts)

	ffnotes.commands = {}
	for command, commandFunction in pairs(commands) do
		local configuredCommand = commandFunction(command_config)

		ffnotes.commands[command] = configuredCommand
		vim.api.nvim_create_user_command(command, configuredCommand, {})
	end
end

return ffnotes
