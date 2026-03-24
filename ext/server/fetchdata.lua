








-- Spaghetti code by iamadeadpixel

---@class fetchdata
fetchdata = class 'fetchdata'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** variables loaded ***");
	end
	end
end)


Events:Subscribe('Player:Joining', function(name, playerGuid, ipAddress, accountGuid)
	fetchplayername[name] = name
	announced[name] = true
	fetchplayerguid[name] = tostring(accountGuid)

end)

Events:Subscribe('Player:Respawn', function(player, recipientMask, message, info, yell, playerGuid, accountGuid)
	fetchteamID[player.name] = nil
	fetchplayerteam1[player.name] = nil
	fetchplayerteam2[player.name] = nil
	fetchplayerteam3[player.name] = nil
	fetchplayerteam4[player.name] = nil

	fetchteamID[player.name] = player.teamId
	fetchplayername[player.name] = player.name

	if fetchteamID[player.name] == 1 then
	fetchplayerteam1[player.name] = player.name
	end

	if fetchteamID[player.name] == 2 then
	fetchplayerteam2[player.name] = player.name
	end

	if fetchteamID[player.name] == 3 then
	fetchplayerteam3[player.name] = player.name
	end

	if fetchteamID[player.name] == 4 then
	fetchplayerteam4[player.name] = player.name
	end


end)

Events:Subscribe('Player:Left', function(player) -- player.name
		-- Removing table data on player left.
	print ("Removing player "..fetchplayername[player.name].." from tables")
			 print ("")
			 print ("PRE Dumping players from list")
			 print ("")

	for place, fetchplayer in pairs(fetchplayername) do
		print ("Found:"..fetchplayer.." in the 'player table'")
		end

			 print ("")

	fetchplayerguid[player.name] = nil
	fetchteamID[player.name] = nil
	fetchplayername[player.name] = nil
	fetchplayerteam1[player.name] = nil
	fetchplayerteam2[player.name] = nil
	fetchplayerteam3[player.name] = nil
	fetchplayerteam4[player.name] = nil

			 print ("")
			 print ("POST Dumping players from list")
			 print ("")
	for place, fetchplayer in pairs(fetchplayername) do
		print ("Found:"..fetchplayer.." in the 'player table'")
		end

			 print ("")
			 print ("End of listed players on server")
end)


return fetchdata()
