








-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** Set winning team loaded ***");
	end
	if SharedUtils:GetCurrentGameMode() == "ConquestLarge0"
	or SharedUtils:GetCurrentGameMode() == "ConquestSmall0"
	or SharedUtils:GetCurrentGameMode() == "AirSuperiority0"
	or SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0"
	or SharedUtils:GetCurrentGameMode() == "ConquestAssaultLarge0"
	or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall0"
	or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall1"
	or SharedUtils:GetCurrentGameMode() == "Domination0"
	or SharedUtils:GetCurrentGameMode() == "Scavenger0"
	or SharedUtils:GetCurrentGameMode() == "TankSuperiority0"
	or SharedUtils:GetCurrentGameMode() == "TeamDeathMatch0"
	or SharedUtils:GetCurrentGameMode() == "TeamDeathMatchC0"
	or SharedUtils:GetCurrentGameMode() == "HeliSuperiority0"
	or SharedUtils:GetCurrentGameMode() == "KingOfTheHill0" then
	winmode = 1
    print ("team wintype US / RU")

    elseif SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0" then
	winmode = 2
    print ("team wintype Alpha / Bravo / Charlie / Delta")

    elseif SharedUtils:GetCurrentGameMode() == "RushLarge0" or SharedUtils:GetCurrentGameMode() == "SquadRush0" then
	winmode = 3
    print ("team wintype Atackers / Defenders")

    elseif SharedUtils:GetCurrentGameMode() == "GunMaster0" then
	winmode = 0
    print ("team wintype -none- ,Disabled in Gunmaster gamemode")

end
end
end)

-- -------------

Events:Subscribe('Player:Chat', function(player, recipientMask, message)

-- -------------------------------
-- This code is ripped from the ingameadmin mod
	if message == '' or player == nil then
		return
	end

	-- lowerkey the message
	message = message:lower()
	var_message = message
	
	-- split the message into parts
	local s_Parts = message:split(' ')
	
	-- check if the first key is not a "."
	if s_Parts[1]:sub(1,1) ~= "." then
		return
	end
	-- only if it starts with "." we go on

	if s_Parts[1] == '.win' then print ("we found the '.win' command") 

-- print the chat input .win into console
	print ("")
	print('Chat: '..player.name..': '..message)

-- Check for valid admin
	fetchadmin(player, data_playername)
	if player.name == selected_admin then

-- If no team is given, report back
	if s_Parts[2] == nil then

	print ("")
	print ("System: Only .win was used")

	if winmode == 0 then
	win_msg1 = "No value needed, GunMaster does not support 'maplist.endround' command"
	end

	if winmode == 1 then
	win_msg1 = "Try .win us or .win ru"
	end

	if winmode == 2 then
	win_msg1 = "Try .win alpha or .win bravo or .win charlie or .win delta"
	end

	if winmode == 3 then
	win_msg1 = "Try .win atackers or .win defenders"
	end
	
	  ChatManager:SendMessage(win_msg1, player)
	print ("")
			   print (win_msg1)
		end

 -- if we dont use this when no value is given, the stuff below will gives a error message
	if s_Parts[2] == nil then return end

 -- Here we check if the team values are correct
	if s_Parts[2] == "us"
	or s_Parts[2] == "ru"
	or s_Parts[2] == "atackers"
	or s_Parts[2] == "defenders"
	or s_Parts[2] == "alpha"
	or s_Parts[2] == "bravo"
	or s_Parts[2] == "charlie"
	or s_Parts[2] == "delta" then

	if winmode == 0 then
	getwinmode0(player,s_Parts)
	end

	if winmode == 1 then
	getwinmode1(player,s_Parts)
	end

	if winmode == 2 then
	getwinmode2(player,s_Parts)
	end

	if winmode == 3 then
	getwinmode3(player,s_Parts)
	end

	else
	print ("")
			 print ("Invalid value found :"..s_Parts[2])
	ChatManager:SendMessage("Invalid value found :"..s_Parts[2], player)
	return
	end

--end
end
end

end)

-- -------------
--[[
	winmode = 0 : -none- ,Disabled in Gunmaster gamemode
	winmode = 1 :  US / RU
	winmode = 2 : Alpha / Bravo / Charlie / Delta
	winmode = 3 : Atackers / Defenders
]]

-- -------------

function getwinmode0(player,s_Parts)

			print ("")
			 print ("winmode0: GunMaster does not support 'maplist.endround' command, Sorry !")
	ChatManager:SendMessage("GunMaster does not support 'maplist.endround' command, Sorry !", player)
	return 
end

-- -------------

function getwinmode1(player,s_Parts)
 -- Here we check if the team values are correct
	if s_Parts[2] == "us"
	or s_Parts[2] == "ru"
	then

	print ("")
	print ("winmode1: Team "..s_Parts[2].." set as round winner")

	if s_Parts[2] == "us" then endround = tostring("1")
	elseif s_Parts[2] == "ru" then endround = tostring("2")
	end
    
	select_winningteam(player,s_Parts)
	else
	print("Sorry, try .win us or .win ru")

end
end

-- -------------

function getwinmode2(player,s_Parts)
 -- Here we check if the team values are correct
	if s_Parts[2] == "alpha"
	or s_Parts[2] == "bravo"
	or s_Parts[2] == "charlie"
	or s_Parts[2] == "delta"
	then

	print ("")
	print ("winmode2: Squad TDM "..s_Parts[2].." set as round winner")

	if s_Parts[2] == "alpha" then endround = tostring("1")
	elseif s_Parts[2] == "bravo" then endround = tostring("2")
	elseif s_Parts[2] == "charlie" then endround = tostring("3")
	elseif s_Parts[2] == "delta" then endround = tostring("4")
	end
    
	select_winningteam(player,s_Parts)
	else
	print("Sorry, try .win alpha or .win bravo or .win charlie or .win delta")

end
end

-- -------------

function getwinmode3(player,s_Parts)
 -- Here we check if the team values are correct
	if s_Parts[2] == "atackers"
	or s_Parts[2] == "defenders"
	then

	print ("")
	print ("winmode3: Rush Team "..s_Parts[2].." set as round winner")

	if s_Parts[2] == "atackers" then endround = tostring("1")
	elseif s_Parts[2] == "defenders" then endround = tostring("2")
	end
    
	select_winningteam(player,s_Parts)
	else
	print("Sorry, try .win atackers or .win defenders")

end
end

-- -------------

function select_winningteam(player,s_Parts)
	print ("")
	print ("System: get winning team selected")
	ChatManager:SendMessage("Selecting "..s_Parts[2].." as round winner")
	print ("")
			  print("Selecting "..s_Parts[2].." as round winner");
	print ("Here we execute the maplist.endround")
--	RCON:SendCommand('mapList.endRound', {"1"})
	RCON:SendCommand('mapList.endRound', {endround})
end

-- -------------

