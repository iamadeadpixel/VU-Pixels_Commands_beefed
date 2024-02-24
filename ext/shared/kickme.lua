if Config.kickme then 
	print("**** Kickme Advanced version is active ****"); 

	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end
end)



Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == "!kickme" then
		for i = 1, 1 do
			math.randomseed(os.time())
			kickme_counter= math.random(1,344) -- Number of kick messages in the table
			end
				
	RCON:SendCommand('admin.kickPlayer', {player.name, (kickmemessagetable[kickme_counter])})


end
end)

Events:Subscribe('Level:Destroy', function()
	print("**** resetting kickme ,round over ****"); 
	end) 

	Events:Subscribe('Player:Left', function(player)
		print("**** Player left ****"); 
	end) 
  
end -- statement used for the config.lua 
