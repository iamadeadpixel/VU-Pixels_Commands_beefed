








-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** punish a player loaded ***");
	end
	end
end)

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
-- This code is ripped from the ingameadmin mod
	if message == '' or player == nil then
		return
	end

	-- lowerkey the message
	message = message:lower()
	
	-- split the message into parts
	local s_Parts = message:split(' ')
	
	-- check if the first key is not a "!"
	if s_Parts[1]:sub(1,1) ~= "." then
		return
	end
	-- only if it starts with "." we go on

	if s_Parts[1] == '.kick' then print ("we found the '.kick' command") 
	kick(message,s_Parts,SendMessage,player)
    end

	if s_Parts[1] == '.kill' then print ("we found the '.kill' command") 
	kill(message,s_Parts,SendMessage,player)
    end


end)

function kick(message,s_Parts,SendMessage,player)

	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	print ("System: kick selected")

	if s_Parts[2] == nil then
	  ChatManager:SendMessage("Error: We need a name here", player)
			   print ("Error: We need a name here")
		end
	
	if s_Parts[2] == nil then return end -- if we dont use this when no name is given, the stuff below will gives a error message

			 print ("")
			 print ("Finding the correct player we have in tables")
			 print ("")

	for _, fetchplayer in pairs(fetchplayername) do
	if string.match(fetchplayer:lower(), s_Parts[2]:lower()) then
			targetplayer = fetchplayer
		print ("Found:"..targetplayer.." in the target 'player table'")
		end
	end
        if targetplayer ~= nil then
			print ("")
			   print ("Found matching playername "..targetplayer)
	  ChatManager:SendMessage("Found matching playername "..targetplayer, player)

	if s_Parts[3] == nil then
		print ("No reason given for targetplayer:"..targetplayer.." with default kick reason: Bye, smell you later")
		RCON:SendCommand('admin.kickPlayer', {targetplayer, "Bye, smell you later"})
		targetplayer = nil

		else ss_message = (s_Parts[1].." "..s_Parts[2])
		s_message = ((message):gsub(ss_message, "")) -- replace .kick player with,,,,,,,nothing !

		print ("Reason given for targetplayer:"..targetplayer.." with kick reason:"..s_message)
		RCON:SendCommand('admin.kickPlayer', {targetplayer, (s_message)})
			targetplayer = nil
	end
		else
			   print ("no matching playername found")
	  ChatManager:SendMessage("no matching playername found", player)
			targetplayer = nil

return end

--end
end
end

function kill(message,s_Parts,SendMessage,player)

	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	print ("System: kill selected")

	if s_Parts[2] == nil then
	  ChatManager:SendMessage("Error: We need a name here", player)
			   print ("Error: We need a name here")
		end
	
	if s_Parts[2] == nil then return end -- if we dont use this when no name is given, the stuff below will gives a error message

			 print ("")
			 print ("Finding the correct player we have in tables")
			 print ("")

	for _, fetchplayer in pairs(fetchplayername) do
	if string.match(fetchplayer:lower(), s_Parts[2]:lower()) then
			targetplayer = fetchplayer
		print ("Found:"..targetplayer.." in the target 'player table'")
		end
	end
        if targetplayer ~= nil then
			print ("")
			   print ("Found matching playername "..targetplayer)
	  ChatManager:SendMessage("Found matching playername "..targetplayer, player)

	if s_Parts[3] == nil then
		print ("No reason given for targetplayer:"..targetplayer..", Preparing the kill with default reason: Exterminated by a Admin")

			RCON:SendCommand('admin.say', {"Exterminated by a Admin ", "player", targetplayer})
		RCON:SendCommand('admin.killPlayer', {targetplayer})
			targetplayer = nil

		else ss_message = (s_Parts[1].." "..s_Parts[2])
		s_message = ((message):gsub(ss_message, "")) -- replace .kill player with,,,,,,,nothing !

		print ("Reason give for targetplayer:"..targetplayer..", Preparing the kill with reason:"..s_message)
			RCON:SendCommand('admin.say', {"Reason for kill: "..s_message, "player", targetplayer})
		RCON:SendCommand('admin.killPlayer', {targetplayer})
			targetplayer = nil
	end
		else
			   print ("no matching playername found")
	  ChatManager:SendMessage("no matching playername found", player)
			targetplayer = nil

return end

--end
end
end
