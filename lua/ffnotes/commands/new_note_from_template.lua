--- @module "ffnotes.commands.new_note"

local constants = require("ffnotes.commands.constants")
local utils = require("ffnotes.commands.utils")
local ioUtils = require("ffnotes.utils.io")

--- @param templates string[]
--- @return string
local function formatTemplates(templates)
	local s = ""
	for i, templateName in ipairs(templates) do
		if i ~= 1 then
			s = s .. "\n"
		end
		s = s .. "[" .. i .. "] " .. templateName
	end
	return s
end

--- @param options Config
--- @return fun(templatePath: string): nil
local newNote = function(options)
	return function()
		local templates = ioUtils.list_files(options.sub_dirs.templates)
		local templateIndex = vim.fn.input(constants.chooseTemplatePrompt .. "\n" .. formatTemplates(templates) .. "\n")

		if templateIndex == nil or tonumber(templateIndex) > #templates then
			error("Note creation aborted: no template selected.")
			return
		end

		local templatePath = options.sub_dirs.templates .. "/" .. templates[tonumber(templateIndex)]
		if not ioUtils.file_exists(templatePath) then
			error("Template file does not exist.")
			return
		end

		local title = vim.fn.input(constants.newNotePrompt)
		if title == nil then
			error("Note creation aborted.")
			return
		end

		local path = options.sub_dirs.inbox .. "/" .. utils.normalize(title, true)
		if not ioUtils.file_exists(path) then
			-- apply init logic
			utils.initNote({
				note = {
					title = title,
					path = path,
					date = utils.getDate("%Y-%m-%d"),
					templatePath = templatePath,
				},
			})
		end

		vim.cmd("tabnew" .. path)
	end
end

return newNote
