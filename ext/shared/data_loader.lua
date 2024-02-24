-- ----- Spaghetti code below this line.
Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" then
		local syncedBFSettings = ResourceManager:GetSettings("SyncedBFSettings")
		if syncedBFSettings ~= nil then
			syncedBFSettings = SyncedBFSettings(syncedBFSettings)
			syncedBFSettings.teamSwitchingAllowed = false
		end
	end
end)

-- -----
	m_GameModeNameMap = {
	["ConquestLarge0"] = "Conquest Large",
	["ConquestSmall0"] = "Conquest Small",
	["RushLarge0"] = "Rush",
	["SquadRush0"] = "Squad Rush",
	["SquadDeathMatch0"] = "Squad Deathmatch",
	["TeamDeathMatch0"] = "Team DeathMatch",
	["TeamDeathMatchC0"] = "Team DeathMatch Close Quarters",
	["ConquestAssaultSmall0"] = "Assault",
	["ConquestAssaultLarge0"] = "Assault64",
	["ConquestAssaultSmall1"] = "Assault #2",
	["GunMaster0"] = "Gun Master",
	["Domination0"] = "Domination",
	["TankSuperiority0"] = "Tank Superiority",
	["Scavenger0"] = "Scavenger",
	["AirSuperiority0"] = "Air Superiority",
	["CaptureTheFlag0"] = "Capture the flag",

-- Keku Game modes
	["KingOfTheHill0"] = "King of the hill",
	["HeliSuperiority0"] = "Heli Superiority"
}

-- -----

---@param p_LevelName string
---@param p_GameMode string
---@param p_IsDedicatedServer boolean
Events:Subscribe('Level:LoadResources', function(p_LevelName, p_GameMode, p_IsDedicatedServer)

	---@diagnostic disable-next-line: undefined-global
	s_GameMode = ServerUtils and ServerUtils:GetCustomGameModeName() or m_GameModeNameMap[p_GameMode] or p_GameMode

	if s_GameMode == "Conquest Large" then 
	s_settings = GameMode_limits_CQL
	goto set_limits

	elseif s_GameMode == "Assault64" then 
	s_settings = GameMode_limits_Assault64
	goto set_limits

	elseif s_GameMode == "Conquest Small" then 
	s_settings = GameMode_limits_CQS
	goto set_limits

	elseif s_GameMode == "Assault" then 
	s_settings = GameMode_limits_Assault
	goto set_limits

	elseif s_GameMode == "Assault #2" then 
	s_settings = GameMode_limits_Assault2
	goto set_limits

	elseif s_GameMode == "Rush" or s_GameMode == "Squad Rush" then 
	s_settings = GameMode_limits_Rush
	goto set_limits

	elseif s_GameMode == "Team DeathMatch" or s_GameMode == "Team DeathMatch Close Quarters" or s_GameMode == "Squad Deathmatch" then 
	s_settings = GameMode_limits_TDM
	goto set_limits

	elseif s_GameMode == "Gun Master" then 
	s_settings = GameMode_limits_GunMaster
	goto set_limits

	elseif s_GameMode == "Domination" then 
	s_settings = GameMode_limits_Domination
	goto set_limits

	elseif s_GameMode == "Tank Superiority" then 
	s_settings = GameMode_limits_TS
	goto set_limits

	elseif s_GameMode == "Scavenger" then 
	s_settings = GameMode_limits_Scavenger
	goto set_limits

	elseif s_GameMode == "Capture the flag" then 
	s_settings = GameMode_limits_CTF
	goto set_limits

	elseif s_GameMode == "Air Superiority" then 
	s_settings = GameMode_limits_AS
	goto set_limits

	elseif s_GameMode == "King of the hill" then 
	s_settings = GameMode_limits_KOTH
	goto set_limits

	elseif s_GameMode == "Heli Superiority" then 
	s_settings = GameMode_limits_HS
	goto set_limits

    end

	::set_limits:: 
	-- the +1 is neede for nil correction
	s_message_spam = (s_settings[1])+1
	s_killme_counter = (s_settings[2])+1
	s_addup_counter = (s_settings[3])+1
	s_killmestack_counter = (s_settings[4])+1


-- -----
	::presets_done:: 
    print("****************** Console spammer: presets set ****************"); 

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2]) 

	 local players = PlayerManager:GetPlayerCount()
	if players <= 16 then
	player_count = (PC[1])
	goto rcon
      
	elseif players >= 17 and players <= 32 then
	player_count = (PC[2])
	goto rcon
      
	elseif players >= 33 and players <= 48 then
	player_count = (PC[3])
	goto rcon

	elseif players >= 49 and players <= 64 then
	player_count = (PC[4])
	goto rcon

	elseif players >= 65 and players <= 128 then
	player_count = (PC[5])
	goto rcon
end

::rcon:: 
-- Used for the console spam
	t_message_spam = s_message_spam-1
	t_killme_counter = s_killme_counter-1
	t_addup_counter = s_addup_counter-1
	t_killmestack_counter = s_killmestack_counter-1

	if Config.consolespam then 
    print("****************** Killme Console spammer ****************"); 
	print('- killme Presets for the next gamemode   : '..s_GameMode..' ')
	print('- Warning send that max stack is reached : '..t_message_spam..' ')
	print('- Default !killme left on first spawn    : '..t_killme_counter..' ')
	print('- Kills needed to grand 1 more !killme   : '..t_addup_counter..' ')
	print('- Max stack on !killme you can earn      : '..t_killmestack_counter..' ')
	print('- Player count: '..player_count..' - Max players:'..s_MaxPlayers..' - Current: '..players..' ') 
	print('- Killme presets loaded')  

end
end)
