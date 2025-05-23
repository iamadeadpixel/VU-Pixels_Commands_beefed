-- Welcome to the magic world of spaghetti coding.

if Config.balance_advanced then 
	print("### balance Advanced version is active ###"); 

	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end

--	print("### Reset balance variables ### xD"); 
	balance_counter = {}
	us_counter = {}
	ru_counter = {}
	up_counter = {}
end)


	balance_message_us = {
-- Preferred not to tamper with these 3 line.
(("This is a dummy entry,and wil not be spammed in the chat" )), -- entry 1
(("*** Last !balance used ***" )),
(("*** You have ONE !balance left for this round ! ***" )),

-- Here you can create your own content, or use the default i made.	
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

	balance_message_ru = {
-- Preferred not to tamper with these 3 line.
(("This is a dummy entry,and wil not be spammed in the chat" )), -- entry 1
(("*** Last !balance used ***" )),
(("*** You have ONE !balance left for this round ! ***" )),

-- Here you can create your own content, or use the default i made.	
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

--
    Events:Subscribe('Player:Respawn', function(player, recipientMask, message,info,yell)
	if balance_counter[player.name] == nil then balance_counter[player.name] = 5 end -- avoid getting a nil error, max usable !balance are 4
	if up_counter[player.name] == nil then up_counter[player.name] = 1 end -- avoid getting a nil error, max usable !balance are 4
    end)

	Events:Subscribe('Player:Chat', function(player, recipientMask, message)

			if message == "!balance" then

		if balance_counter[player.name] == 1 then ChatManager:SendMessage(('Sorry, No more !balance this round,wait till next round : ' ) , player)

		elseif player.teamId == 1 then print("****  US -> RU check "..up_counter[player.name].."/4] - "..player.name.." ****");

			for i = 1, 1 do
				math.randomseed(os.time())
				ru_counter[player.name]= math.random(4,22)
			end
			ChatManager:SendMessage("{"..up_counter[player.name].."/4]-".. (balance_message_ru[ru_counter[player.name]]), player)

		RCON:SendCommand('admin.movePlayer', {player.name, "2", "1", "true"})
	balance_counter[player.name]=(balance_counter[player.name])-1
	up_counter[player.name]=up_counter[player.name] + 1
    

		elseif player.teamId == 2 then print("****  RU -> US check "..up_counter[player.name].."/4] - "..player.name.." ****");

			for i = 1, 1 do
				math.randomseed(os.time())
				us_counter[player.name]= math.random(4,22)
			end
			ChatManager:SendMessage("{"..up_counter[player.name].."/4]-".. (balance_message_us[us_counter[player.name]]), player)

		RCON:SendCommand('admin.movePlayer', {player.name, "1", "1", "true"})
	balance_counter[player.name]=(balance_counter[player.name]) - 1
	up_counter[player.name]=up_counter[player.name] + 1

end
end
end)

Events:Subscribe('Level:Destroy', function()
	balance_counter = {}
	us_counter = {}
	ru_counter = {}
	up_counter = {}
		end) 

	Events:Subscribe('Player:Left', function(player)
	balance_counter[player.name] = {}
	us_counter[player.name] = {}
	ru_counter[player.name] = {}
	up_counter[player.name] = {}
end) 
  
end -- statement used for the config.lua   
