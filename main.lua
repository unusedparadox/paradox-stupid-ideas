---@diagnostic disable: duplicate-set-field
----------------------------------------------
------------MOD CODE -------------------------
to_big = to_big or function(x) return x end -- Talisman compat

PSI = {}

PSI.gameset = {}

if G.PROFILES[G.SETTINGS.profile].para_gameset == "unfiltered" then
	PSI.gameset.unfiltered = true
elseif G.PROFILES[G.SETTINGS.profile].para_gameset == "upgraded" then
	PSI.gameset.upgraded = true
end
PARA_ASPL = {}
PARA_ASPL.FUNC = {}
PARA_ASPL.G = {}

PARA_ASPL.G.MODPATH = SMODS.current_mod.path
local NFS = require("nativefs")

function PARA_ASPL.FUNC.RequireFolder(path)
	local files = NFS.getDirectoryItemsInfo(PARA_ASPL.G.MODPATH .. "/" .. path)
	for i = 1, #files do
		local file_name = files[i].name
		if file_name:sub(-4) == ".lua" then
			assert(SMODS.load_file(path .. file_name))()
			print("[PSI] Loaded " .. path .. file_name)
		end
	end
end


function PARA_ASPL.FUNC.RequireFolderRecursive(path)
	local function scan(currentPath)
		local fullPath = PARA_ASPL.G.MODPATH .. "/" .. currentPath
		local files = NFS.getDirectoryItemsInfo(fullPath)

		for _, fileInfo in ipairs(files) do
			local fileName = fileInfo.name
			local fileType = fileInfo.type
			local childPath = currentPath == "" and fileName or currentPath .. "/" .. fileName

			if fileType == "directory" then
				-- Recursively scan subdirectories
				scan(childPath)
			elseif fileType == "file" and fileName:sub(-4) == ".lua" then
				-- Load the Lua file with proper relative path
				assert(SMODS.load_file(childPath))()
				print("[PSI]Loaded " .. childPath)
			end
		end
	end
	scan(path)  -- Start scanning from initial path
end
PARA_ASPL.FUNC.RequireFolderRecursive("lib")
PARA_ASPL.FUNC.RequireFolderRecursive("content")
if CardSleeves then
	PARA_ASPL.FUNC.RequireFolderRecursive("crossmod/CardSleeves")
end
if GB then
	PARA_ASPL.FUNC.RequireFolderRecursive("crossmod/GrabBag")
end
----------------------------------------------
------------MOD CODE END----------------------