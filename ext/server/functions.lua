








-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** functions loaded ***");
	end

	if SharedUtils:GetCurrentGameMode() == "ConquestLarge0"
	or SharedUtils:GetCurrentGameMode() == "ConquestSmall0"
	or SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0"
	or SharedUtils:GetCurrentGameMode() == "ConquestAssaultLarge0"
	or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall0"
	or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall1"
	or SharedUtils:GetCurrentGameMode() == "TankSuperiority0"
	or SharedUtils:GetCurrentGameMode() == "HeliSuperiority0"
	then
	swapmode = 1
    print ("team swaptype US / RU")

	elseif SharedUtils:GetCurrentGameMode() == "AirSuperiority0"
	or SharedUtils:GetCurrentGameMode() == "Domination0"
	or SharedUtils:GetCurrentGameMode() == "GunMaster0"
	or SharedUtils:GetCurrentGameMode() == "Scavenger0"
	or SharedUtils:GetCurrentGameMode() == "TeamDeathMatch0"
	or SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0"
	or SharedUtils:GetCurrentGameMode() == "TeamDeathMatchC0"
	or SharedUtils:GetCurrentGameMode() == "KingOfTheHill0"
	then
	swapmode = 2
    print ("team swap disabled")

    elseif SharedUtils:GetCurrentGameMode() == "RushLarge0"
	or SharedUtils:GetCurrentGameMode() == "SquadRush0"
	then
	swapmode = 3
    print ("team swaptype Atackers / Defenders")

end
end
end)


-- -------------

-- This code is ripped from the ingameadmin mod
function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end -- end of function call

-- -------------

function coreadmin_cm(player, targetplayer)
	print ("Check if "..targetplayer.." is a core admin")
	for _, admin in pairs(Get_admins) do
		if admin == targetplayer then selected_admin = admin
		print ("Found:"..selected_admin..", is a core admin !!")
		breakpoint = true
		end
	end

	if targetplayer ~= selected_admin then
		ChatManager:SendMessage("Not a core admin", player)
				  print("Not a core admin")
			breakpoint = false
end
end -- end of function call

-- -------------

function coreadmin(player, data_playername)
	print ("Check if "..player.name.." is a core admin")
	for _, admin in pairs(Get_admins) do
		if admin == player.name then selected_admin = admin
		print ("Found:"..selected_admin..", is a core admin")
		end
	end

	if player.name ~= selected_admin then
		ChatManager:SendMessage("You dont have permissions "..player.name, player)
				  print("You dont have permissions "..player.name)
end
end -- end of function call

-- -------------

function fetchadmin(player, data_playername)
	print ("Check if "..player.name.." is a admin here")
	for _, admin in pairs(Get_admins) do
		if admin == player.name then selected_admin = admin
		print ("Found:"..selected_admin..", is in the 'admin table'")
		end
	end

	if player.name ~= selected_admin then
		ChatManager:SendMessage("You dont have permissions "..player.name, player)
				  print("You dont have permissions "..player.name)
end
end

-- -------------

function reboot(player)
	ChatManager:SendMessage("rebooting the server")
			  print("Rebooting the server");
	RCON:SendCommand('admin.shutDown')
end

-- -------------

function reboot_timer(player)
	if trigger_nuke == false then
			 print ("Starting the Reboot timer")
	ChatManager:SendMessage("Starting the Reboot timer")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Reboot"
	timer_msg_2 = "Reboot"
	nuketype_reboot = true

	else print ("Reboot countdown already started") 
	ChatManager:SendMessage("Reboot countdown already started")
	end
end

-- -------------

function swap_2us(player)
		if player.teamId == 1 then
	ChatManager:SendMessage("You are already on the American team", player)
			  print("You are already on the American team");
		else
	ChatManager:SendMessage("Moving you to the American team", player)
			  print("Moving you to the american team");
  	fetchplayerteam1[player.name] = nil
	fetchplayerteam2[player.name] = nil
	fetchplayerteam3[player.name] = nil
	fetchplayerteam4[player.name] = nil
	RCON:SendCommand('admin.movePlayer', {player.name, "1", "1", "true"})
	fetchplayerteam1[player.name] = player.name
end
end

-- -------------

function swap_2ru(player)
		if player.teamId == 2 then
	ChatManager:SendMessage("You are already on the Russian team", player)
			  print("You are already on the Russian team");
		else
	ChatManager:SendMessage("Moving you to the Russian team", player)
			  print("Moving you to the Russian team");
  	fetchplayerteam1[player.name] = nil
	fetchplayerteam2[player.name] = nil
	fetchplayerteam3[player.name] = nil
	fetchplayerteam4[player.name] = nil
	RCON:SendCommand('admin.movePlayer', {player.name, "2", "1", "true"})
	fetchplayerteam1[player.name] = player.name
end
end

-- -------------

function nextmap()
	ChatManager:SendMessage("Running the next map")
			  print("Running the next map");
	RCON:SendCommand('mapList.runNextRound')
end

-- -------------

function reloadmap()
	ChatManager:SendMessage("Reloading the current map")
			  print("Reloading the current map");
	RCON:SendCommand('maplist.restartRound')
end

-- -------------


function checkgamemode()
	if SharedUtils:GetCurrentGameMode() == "ConquestLarge0"
	or SharedUtils:GetCurrentGameMode() == "ConquestSmall0"
	or SharedUtils:GetCurrentGameMode() == "AirSuperiority0"
	or SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0"
	or SharedUtils:GetCurrentGameMode() == "ConquestAssaultLarge0"
	or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall0"
	or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall1"
	or SharedUtils:GetCurrentGameMode() == "Domination0"
	or SharedUtils:GetCurrentGameMode() == "GunMaster0"
	or SharedUtils:GetCurrentGameMode() == "Scavenger0"
	or SharedUtils:GetCurrentGameMode() == "TankSuperiority0"
	or SharedUtils:GetCurrentGameMode() == "TeamDeathMatch0"
	or SharedUtils:GetCurrentGameMode() == "TeamDeathMatchC0"
	or SharedUtils:GetCurrentGameMode() == "HeliSuperiority0"
	or SharedUtils:GetCurrentGameMode() == "KingOfTheHill0" then
	foundgamemode = true
	else 
	foundgamemode = false
    end

end

-- -------------

function checkgamemode_sqdm()

    if SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0" then
	foundgamemode = true
	else 
	foundgamemode = false
	end
end

-- -------------

function checkgamemode_rush()

	if SharedUtils:GetCurrentGameMode() == "RushLarge0" or SharedUtils:GetCurrentGameMode() == "SquadRush0" then
	foundgamemode = true
	else 
	foundgamemode = false
	end

end

-- ------------------------

function swapteams_timer(player)
	if trigger_nuke == false then
			 print ("Starting the Swap teams timer")
	ChatManager:SendMessage("Starting the Swap teams timer")
	print ("Setting the timer data") 
	nuke_countdown = 3
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Swap teams"
	timer_msg_2 = "Swap teams"
	nuketype_swap_all = true

		    else print ("Swap teams countdown already started") 
	ChatManager:SendMessage("Swap teams countdown already started")
	end
end

-- -------------

function swapteams(player)
	ChatManager:SendMessage("** Swapping out teams! **", player)
			  print("** Swapping out teams! **");

	if swapmode == 1 then

	for fetchplayer, place in pairs(fetchteamID) do
		if place == 1 then _place = "US"


			 print ("Moving "..fetchplayer.." to team RU")
	ChatManager:SendMessage("Moving "..fetchplayer.." to team RU")
		RCON:SendCommand('admin.movePlayer', {fetchplayer, "2", "1", "true"})

		elseif place == 2 then _place = "RU"

			 print ("Moving "..fetchplayer.." to team US")
	ChatManager:SendMessage("Moving "..fetchplayer.." to team US")
		RCON:SendCommand('admin.movePlayer', {fetchplayer, "1", "1", "true"})
		end
	end
end
--

	if swapmode == 2 then 
			 print (".swap all Disabled")
	ChatManager:SendMessage(".swap all Disabled")
	end
--

	if swapmode == 3 then

	for fetchplayer, place in pairs(fetchteamID) do
		if place == 1 then _place = "Atackers"

			 print ("Moving "..fetchplayer.." to Defenders team")
	ChatManager:SendMessage("Moving "..fetchplayer.." to Defenders team")
		RCON:SendCommand('admin.movePlayer', {fetchplayer, "2", "1", "true"})

		elseif place == 2 then _place = "Defenders"

			 print ("Moving "..fetchplayer.." to Atackers team")
	ChatManager:SendMessage("Moving "..fetchplayer.." to Atackers team")
		RCON:SendCommand('admin.movePlayer', {fetchplayer, "1", "1", "true"})
		end
	end
end
--

--
end

-- -------------
