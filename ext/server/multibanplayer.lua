








-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** multiban loaded ***");
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

	if s_Parts[1] == '.ban' then print ("we found the '.ban' command") 
	bantype = "ban"
	fetchadmin(player, data_playername)
	if player.name == selected_admin then

-- print the chat input .ban into console
	print ("")
	print('Chat: '..player.name..': '..message)
	print ("")
	checkplayertoban(targetplayer,message,s_Parts,SendMessage,player)

--end
--end
end
end

	if s_Parts[1] == '.tban' then print ("we found the '.tban' command") 
	bantype = "tban"
	fetchadmin(player, data_playername)
	if player.name == selected_admin then

--
	table_permission_type = "CanTBan"
	s_permissions_type = "Time ban"
	permissions(player)
	if s_permissions == true then
--

-- print the chat input .tban into console
	print ("")
	print('Chat: '..player.name..': '..message)
	print ("")
	checkplayertoban(targetplayer,message,s_Parts,SendMessage,player)
end
end
end

	if s_Parts[1] == '.rban' then print ("we found the '.rban' command") 
	bantype = "rban"
	fetchadmin(player, data_playername)
	if player.name == selected_admin then

--
	table_permission_type = "CanRBan"
	s_permissions_type = "round ban"
	permissions(player)
	if s_permissions == true then
--

-- print the chat input .rban into console
	print ("")
	print('Chat: '..player.name..': '..message)
	print ("")
	checkplayertoban(targetplayer,message,s_Parts,SendMessage,player)
end
end
end

end)

-- --------------------------

-- Global: on input .ban / tban . rban , player check on exist.
function checkplayertoban(targetplayer,message,s_Parts,SendMessage,player)
-- checkplayertoban stuff from here

	print ("System: checkplayertoban selected")

	if s_Parts[2] == nil then
	  ChatManager:SendMessage("Oeps: We need a name here", player)
			   print ("Oeps: We need a name here")
		end
	
	if s_Parts[2] == nil then return end -- if we dont use this when no name is given, the stuff below will gives a error message

			 print ("")
			 print ("Finding the correct player to ban we have in tables")

	for name, fetchguid in pairs(fetchplayerguid) do
	if string.match(name:lower(), s_Parts[2]:lower()) then
			targetplayer = name
			targetguid = fetchguid
		print ("tablecheck: We found "..targetplayer.." with "..targetguid.." as Guid")
		end
	end

	if targetplayer == nil then
			print ("")
			print ("no matching playername found")
	  ChatManager:SendMessage("no matching playername found", player)
		targetplayer = nil
		targetguid = nil
		s_targetguid = nil
    return

	elseif targetplayer ~= nil then
		s_targetguid = ((targetguid):gsub("-", "")) -- replace - with,,,,,,,nothing !
			print ("")
			   print ("Found matching playername "..targetplayer.." with "..s_targetguid.." as Guid")
	  ChatManager:SendMessage("Found matching playername "..targetplayer, player)


-- Here we continue after the check (what is usedfor test only)
	if targetplayer == selected_admin then
			 print ("ABORT ACTION :"..targetplayer.." is a admin")
	ChatManager:SendMessage("ABORT ACTION :"..targetplayer.." is a admin", player)
		targetplayer = nil
		targetguid = nil
		s_targetguid = nil
    return
	elseif targetplayer ~= selected_admin then

	if bantype == "ban" then
	print ("ban function call callled")
	ban(s_Parts,player,targetplayer,message)
	end

	if bantype == "tban" then
	print ("tban function call callled")
	tban(s_Parts,player,targetplayer,message)
	end

	if bantype == "rban" then
	print ("rban function call callled")
	rban(s_Parts,player,targetplayer,message)
	end

end
end
end -- end of function call

-- --------------------------

function ban(s_Parts,player,targetplayer,message)
	print ("System: Ban player selected")

	if s_Parts[3] == nil then

			 print ("No reason given: targetplayer "..targetplayer.." using default permban reason: Perma banned by admin")
	ChatManager:SendMessage("Permban "..targetplayer.." by a admin")


	RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "perm", "PERM banned by admin"}) -- permban
		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)


	print ("Player banned without reason xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil

	elseif s_Parts[3] ~= nil then

		ss_message = (s_Parts[1].." "..s_Parts[2])
		s_message = ((message):gsub(ss_message, "")) -- replace .ban player with,,,,,,,nothing !
		s_targetguid = ((targetguid):gsub("-", "")) -- replace - with,,,,,,,nothing !

	print ("Reason given for targetplayer:"..targetplayer..", Preparing the Perma ban with reason:"..s_message)
	ChatManager:SendMessage("Permban "..targetplayer.." Reason:"..s_message)


	RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "perm", s_message}) -- permban
		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)

	print ("Player banned with reason xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil

end
end -- end of function call

-- --------------------------
-- --------------------------

function tban(s_Parts,player,targetplayer,message)
	print ("System: Tban player selected")

	if s_Parts[3] == nil then

			 print ("No reason given: targetplayer "..targetplayer.." using default timeban reason: Time banned by admin for "..s_timeban.." Seconds")
	ChatManager:SendMessage("Timeban "..targetplayer.." by a admin for "..s_timeban.." Seconds")

	RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", ""..s_timeban.."", "Time banned by admin"}) -- Timeban
		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)


	print ("Player Time banned xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil

		else ss_message = (s_Parts[1].." "..s_Parts[2])
		s_message = ((message):gsub(ss_message, "")) -- replace .ban player with,,,,,,,nothing !
		s_targetguid = ((targetguid):gsub("-", "")) -- replace - with,,,,,,,nothing !

			 print ("Reason given for targetplayer:"..targetplayer..", Preparing the Time ban for "..s_timeban.." Seconds, with reason:"..s_message)
	ChatManager:SendMessage("Timeban "..targetplayer.." for "..s_timeban.." Reason:"..s_message)


	RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", ""..s_timeban.."", s_message})
		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)


	print ("Player Time banned with reason xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil

end
end -- end of function call

-- --------------------------
-- --------------------------

function rban(s_Parts,player,targetplayer,message)
	print ("System: Rban player selected")

	if s_Parts[3] == nil then

			 print ("No reason given: targetplayer "..targetplayer.." using default roundban reason: Round banned by admin for "..s_roundban.." rounds")
	ChatManager:SendMessage("Roundban "..targetplayer.." by admin for "..s_roundban.." rounds")

-- Dumb solution til i found a real fix


	RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", ""..s_roundban.."", "Round banned by admin"})
		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)


	print ("Player Round banned xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil

		else ss_message = (s_Parts[1].." "..s_Parts[2])
		s_message = ((message):gsub(ss_message, "")) -- replace .ban player with,,,,,,,nothing !
		s_targetguid = ((targetguid):gsub("-", "")) -- replace - with,,,,,,,nothing !

			 print ("Reason given for targetplayer:"..targetplayer..", Preparing the Roundban for "..s_roundban.." rounds, with reason:"..s_message)
	ChatManager:SendMessage("Roundban "..targetplayer.." for "..s_roundban.." rounds, with reason:"..s_message)


	RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", ""..s_roundban.."", s_message})
		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)


	print ("Player Round banned with reason xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil

end
end -- end of function call

-- --------------------------
