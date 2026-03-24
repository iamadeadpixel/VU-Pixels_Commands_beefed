 m_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_007/MP_007"] = "Caspian Border",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/MP_012/MP_012"] = "Operation Firestorm",
	["Levels/MP_013/MP_013"] = "Damavand Peak",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_018/MP_018"] = "Kharg Island",
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro",
	["Levels/XP1_001/XP1_001"] = "Strike at Karkand",
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman",
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula",
	["Levels/XP1_004/XP1_004"] = "Wake Island",
	["Levels/XP2_Factory/XP2_Factory"] = "Scrapmetal",
	["Levels/XP2_Office/XP2_Office"] = "Operation 925",
	["Levels/XP2_Palace/XP2_Palace"] = "Donya Fortress",
	["Levels/XP2_Skybar/XP2_Skybar"] = "Ziba Tower",
	["Levels/XP3_Alborz/XP3_Alborz"] = "Alborz Mountains",
	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP3_Shield/XP3_Shield"] = "Armored Shield",
	["Levels/XP3_Valley/XP3_Valley"] = "Death Valley",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/XP4_Parl/XP4_Parl"] = "Azadi Palace",
	["Levels/XP4_Quake/XP4_Quake"] = "Epicenter",
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market",
	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline",

	["Levels/COOP_002/COOP_002"] = "Hit and Run",
	["Levels/COOP_006/COOP_006"] = "Aygan Village",
	["Levels/COOP_010/COOP_010"] = "The Eleventh Hour",
	["Levels/SP_Jet/SP_Jet"] = "Carrier",
	["Levels/SP_Valley/SP_Valley"] = "Rock and a Hard Place",
	["Levels/SP_Villa/SP_Villa"] = "Kaffarov's Villa"
}

 m_GameModeNameMap = {
	["ConquestLarge0"] = "Conquest Large",
	["ConquestSmall0"] = "Conquest Small",
	["RushLarge0"] = "Rush",
	["SquadDeathMatch0"] = "Squad Deathmatch",
	["SquadRush0"] = "Squad Rush",
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

	["KingOfTheHill0"] = "King of the hill",
	["HeliSuperiority0"] = "Heli Superiority"
}

---@param p_LevelName string
---@param p_GameMode string
---@param p_IsDedicatedServer boolean
Events:Subscribe('Level:LoadResources', function(p_LevelName, p_GameMode, p_IsDedicatedServer)
	 s_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or m_LevelNameMap[p_LevelName] or p_LevelName
	 s_GameMode = ServerUtils and ServerUtils:GetCustomGameModeName() or m_GameModeNameMap[p_GameMode] or p_GameMode
end)

