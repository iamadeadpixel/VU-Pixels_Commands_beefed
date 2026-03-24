-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then

	if Config.header then
		print("*** Tables loaded ***");
	end

print ("Building tables")
	s_Parts = {}
	fetchteamID = {}

	fetchplayerteam1 = {}
	fetchplayerteam2 = {}
	fetchplayerteam3 = {}
	fetchplayerteam4 = {}

	modbuild = {}
	
	nuketype_us = false
	nuketype_ru = false
	nuketype_all = false
	nuketype_swap_all = false

	nuketype_alpha = false
	nuketype_bravo = false
	nuketype_charlie = false
	nuketype_delta = false

	nuketype_defenders = false
	nuketype_atackers = false

	start_nuke_timer_all = false
	trigger_nuke = false

	end
end)


--[[
Default variables what NOT should be reset on reload or next map load..
]]
	announced = {}
	fetchplayerguid = {}
	fetchplayername = {}
	s_timeban = 86400 -- 24 hours
	s_roundban = 2 -- 2 round
