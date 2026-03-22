-- Welcome to the magic world of spaghetti coding.

if Config.banme then 
	print("**** banme is active ****"); 

	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end
end)

	b_fetchplayerguid = {}
	b_fetchplayername = {}


Events:Subscribe('Player:Joining', function(name, playerGuid, ipAddress, accountGuid)
	b_fetchplayername[name] = name
	b_fetchplayerguid[name] = tostring(accountGuid)
end)

Events:Subscribe('Player:Left', function(player) -- player.name
		-- Removing table data on player left.
	print ("Removing player "..b_fetchplayername[player.name].." from tables")
			 print ("PRE Dumping players from list")

	for place, b_fetchplayer in pairs(b_fetchplayername) do
		print ("Found:"..b_fetchplayer.." in the 'player table'")
		end

			 print ("")
	b_fetchplayerguid[player.name] = nil
	b_fetchplayername[player.name] = nil

			 print ("POST Dumping players from list")
			 print ("")
	for place, b_fetchplayer in pairs(b_fetchplayername) do
		print ("Found:"..b_fetchplayer.." in the 'player table'")
		end

			 print ("End of listed players on server")
end)

-- ---------------------------------------------------------
Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == "!banme" or message == ".banme" or message == "/banme" then

		s_targetguid = ((b_fetchplayerguid[player.name]):gsub("-", "")) -- replace - with,,,,,,,nothing !
			print ("")
			   print ("Found matching playername "..b_fetchplayername[player.name].." with "..s_targetguid.." as Guid")

	print ("Check if "..b_fetchplayername[player.name].." is in the whitelist.")
	for _, b_whitelist in pairs(whitelist) do
		if b_whitelist == b_fetchplayername[player.name] then whitelist_player = b_whitelist
				 print ("Found:"..whitelist_player..", is in the 'whitelist table'")
		ChatManager:SendMessage("Protected players cant use .banme command" , player)
		end
	end -- If the player was in the whitelist, here it ends.

	if b_fetchplayername[player.name] ~= whitelist_player then
		ChatManager:SendMessage("Player "..b_fetchplayername[player.name].." used them .banme command")
				  print("Player "..b_fetchplayername[player.name].." used them .banme command")

	RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "perm", "Selfban using .banme ("..b_fetchplayername[player.name]..")"})
		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)

	end



end
end)
  
end -- statement used for the config.lua 
