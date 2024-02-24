-- Welcome to the magic world of spaghetti coding.

if Config.balance then 
	print("**** balance Advanced version is active ****"); 

	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end
end)

local balance_message_us = {
	(("abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmno" )), -- 51 chars, 50 prefered
	(("Yoda says, American team, it is" )),
	(("Uncle sam moved you to his team" )),
	(("Joining the American army" )),
	(("You got bribed, American team pays more" )),
	(("Your time in the American team will be appreciated" )),
	(("Your professionalism is a asset for the American team" )),
	(("Your expertise is a asset for the American team" )),
	(("Your presence in the American team is a gift to us all" )),
	(("Your resilience is appreciated in the American team" )),
	(("Your talent in the American team will be rewarded" )),
	(("Your passion in the American team is contagious" )),
	(("your life in the American team has crunchy moments!" )),
	(("your fun in the American team wil be a triumph" )),
	(("The contributions for the American team is impact" )),
	(("The impact on the American team will be significant" )),
	(("You're joining the American team ? how fantastic!" )),
	(("your future in the American team has endless joy" )),
	(("Your legacy for the American team is inspireing" )),
	(("Moveing you to the American team" ))
	

}

local balance_message_ru = {
	(("abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmno" )), -- 51 chars, 50 prefered
	(("Yoda says, Russian team, it is" )),
	(("The russian czar moved you to his team" )),
	(("Joining the Russian army" )),
	(("You got bribed, Russian team pays more" )),
	(("Your professionalism is a asset for the Russian team" )),
	(("Your time in the Russian team will be appreciated" )),
	(("Your expertise is a asset for the Russian team" )),
	(("Your presence in the Russian team is a gift to us all" )),
	(("Your resilience is appreciated in the Russian team" )),
	(("Your talent in the Russian team will be rewarded" )),
	(("Your passion in the Russian team is contagious" )),
	(("your life in the Russian team has crunchy moments!" )),
	(("your fun in the Russian team wil be a triumph" )),
	(("The contributions for the Russian team is impact" )),
	(("The impact on the Russian team will be significant" )),
	(("You're joining the Russian team ? how fantastic!" )),
	(("your future in the Russian team has endless joy" )),
	(("Your legacy for the Russian team is inspireing" )),
	(("Moveing you to the Russian team" ))

	
}

local balance_users = {}
local us_counter = {}
local ru_counter = {}
--
	Events:Subscribe('Player:Chat', function(player, recipientMask, message)

    Events:Subscribe('Player:Respawn', function(player, recipientMask, message,info,yell)
--		if balance_users[player.name] == nil then balance_users[player.name] = 1 ; 	print("****  Setting the balance_users string ****"); end -- (DO NOT CHANGE THIS !)
--		if us_counter[player.name] == nil then us_counter[player.name] = 1 ; 	print("****  Setting the us_counter string ****"); end -- (DO NOT CHANGE THIS !)
--		if ru_counter[player.name] == nil then ru_counter[player.name] = 1 ; 	print("****  Setting the ru_counter string ****"); end -- (DO NOT CHANGE THIS !)
    end)

--    if message == "zz" then print("****  Dummy check ****"); 
		if string.find(message, "!swap us") then
		if player.teamId == 1 then
			ChatManager:SendMessage("You are already on the American team", player)
		else
			ChatManager:SendMessage("Moveing you to the American team", player)
			RCON:SendCommand('admin.movePlayer', {player.name, "1", "1", "true"})
        end

	elseif string.find(message, "!swap ru") then
		if player.teamId == 2 then
			ChatManager:SendMessage("You are already on the Russian team", player)
		else
		ChatManager:SendMessage("Moveing you to the Russian team", player)
	  RCON:SendCommand('admin.movePlayer', {player.name, "2", "1", "true"})
        end 
-- the stuff above works correct
-- The stuff below this, is, well, $#^#^#&@#

    		elseif message == "!balance" then
			if player.teamId == 1 then print("****  US -> RU check ****"); 
				for i = 1, 1 do
					math.randomseed(os.time())
					ru_counter[player.name]= math.random(2,19)
					end
		

				ChatManager:SendMessage( (balance_message_ru[ru_counter[player.name]]), player)

		RCON:SendCommand('admin.movePlayer', {player.name, "2", "1", "true"})
--		ru_counter[player.name]=(ru_counter[player.name])+1
--			if ru_counter[player.name] == 5 then ru_counter[player.name] = 1
--    end
    
	  elseif message == "!balance" then

		if player.teamId == 2 then print("****  RU -> US check ****"); 
			for i = 1, 1 do
				math.randomseed(os.time())
				us_counter[player.name]= math.random(2,19)
				end
	

			ChatManager:SendMessage( (balance_message_us[us_counter[player.name]]), player)

		RCON:SendCommand('admin.movePlayer', {player.name, "1", "1", "true"})
--		us_counter[player.name]=(us_counter[player.name])+1
--			if us_counter[player.name] == 5 then us_counter[player.name] = 1
  

--end
end
end
end
end)

Events:Subscribe('Level:Destroy', function()
	print("**** resetting balance ,round over ****"); 
	local balance_users = {}
	local us_counter = {}
	local ru_counter = {}
		end) 

	Events:Subscribe('Player:Left', function(player)
		print("**** Player left ****"); 
		local balance_users = {}
		local us_counter = {}
		local ru_counter = {}
			end) 
  
end -- statement used for the config.lua  
