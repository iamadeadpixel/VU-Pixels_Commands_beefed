-- Spaghetti code by iamadeadpixel

---@class Adminstuff
Adminstuff = class 'Adminstuff'
 
function Adminstuff:__init()
	Events:Subscribe('Extension:Loaded', self, self.OnExtensionLoaded)
end

function Adminstuff:OnExtensionLoaded()
	print("Initializing Adminstuff")
	self:RegisterEvents()
end

function Adminstuff:RegisterEvents()
	Events:Subscribe('Engine:Init', self, self.OnEngineInit)
	Events:Subscribe('Level:Destroy', self, self.OnLevelDestroy)
end

function Adminstuff:OnEngineInit()

	self.m_config = require 'config'
	self.m_setvariables = require 'setvariables'
	self.m_timers = require 'timers'
	self.m_functions = require 'functions'
	self.m_commands = require 'commands'
	self.m_tables = require 'tables'
	self.m_fetchdata = require 'fetchdata'
	self.m_punishplayer = require 'punishplayer'
	self.m_moveplayer = require 'moveplayer'
	self.m_multibanplayer = require 'multibanplayer'
	self.m_nukeplayers = require 'nukeplayers'
	self.m_winningteam = require 'winningteam'

end

function Adminstuff:OnLevelDestroy()
	print("********* ADMIN data whiped on level destroy *********");

	local s_OldMemory = math.floor(collectgarbage("count") / 1024)
	collectgarbage('collect')
	print("*Collecting Garbage on Level Destroy: " ..
	math.floor(collectgarbage("count") / 1024) .. " MB | Old Memory: " .. s_OldMemory .. " MB")
end

Adminstuff()
