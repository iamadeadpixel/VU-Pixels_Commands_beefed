if Config.Killme_advanced then 
	print("**** Killme Advanced version is active ****"); 

	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end
end)


local killmemessagetable = {
-- Preferred not to tamper with these 3 line.
(("This is a dummy entry,and wil not be spammed in the chat" )), -- entry 1
(("*** Last killme used, make more kills to gain a !killme again ***" )),
(("*** You have ONE !killme left for this round ! ***" )),

-- Here you can create your own content, or use the default i made.	
(("Yoda says, exit you shoose." )),
(("Took a deep inhale from his bong, ups, poisoned dope" )), -- At here your !killme spams (Entry 5)
(("Cranked his defib to max, FAIL, and died" )),
(("chose to die as kamikaze" )),
(("chose to slith his throat and died" )),
(("did a drugs overdose and died" )),
(("used the suicide shortcut" )), -- Entry 10
(("want to see the bright light" )),
(("did a hail merry on him self" )),
(("found a different exit and used it,and died." )),
(("was high as shit and died" )),
(("The fastes way? ,close yes, cross the street" )), -- entry 15
(("Droped his grenade and refused to run away" )),
(("Lord vader did a jedi mind trick" )),
(("was high as shit and died" )),
(("Suicide was not painless" )),
(("U took the red pill,and it ended your ingame life" )), -- entry 20
(("U took the blue pill,and your coffee is cold" )),
(("Now it is time to play a round pokemon GO" )),
(("Elvis did not left the gameroom, u did" )),
(("U could asked a admin to kill you, hehe" )),
(("Great !, you dog needs to do booboo outside !" )) -- entry 25
}

local killme_users = {}

Events:Subscribe('Player:Respawn', function(player, recipientMask, message,info,yell)
	if killme_users[player.name] == nil then killme_users[player.name] = 5 end -- avoid getting a nil error, max usable !killme are 4
end)

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == "!killme" then
		if killme_users[player.name] == 1 then ChatManager:SendMessage(('Sorry, thats it,wait till next round : ' ) , player) -- Default message when all !killme are used.
		else do

		ChatManager:SendMessage(( (killmemessagetable[killme_users[player.name]]) ), player)
	RCON:SendCommand('admin.killPlayer', {player.name})
	killme_users[player.name]=(killme_users[player.name])-1
			end
		end
	end
end)

Events:Subscribe('Level:Destroy', function()
	killme_users = {}
	end) 

	Events:Subscribe('Player:Left', function(player)
	killme_users[player.name] = 5 -- This should reset player !killme data back to 4 useable commands when they rejoin again
	end) 
  
end -- statement used for the config.lua 
