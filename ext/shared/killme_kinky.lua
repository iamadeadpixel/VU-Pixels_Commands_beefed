if Config.Killme_kinky then  
	print("**** Killme Kinky version is active ****"); 

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end
end)

-- ----

local spawnmessagetable = {
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

local announcedPlayers = {} 
local addup_users = {}
local killme_users = {}
local message_users = {}

Events:Subscribe('Player:Killed', function(player, inflictor, position, weapon, isRoadKill, isHeadShot, wasVictimInReviveState, info)
	if inflictor and message_users[inflictor.name]== s_message_spam then return end
	if inflictor then addup_users[inflictor.name]=(addup_users[inflictor.name])+1  -- (DO NOT CHANGE THIS !)
	end


	if inflictor and addup_users[inflictor.name]== s_addup_counter  then  killme_users[inflictor.name]=(killme_users[inflictor.name])+1 -- (DO NOT CHANGE THIS !)
		addup_users[inflictor.name] = 1 -- if the value has reached, this wil reset it back to 1. (DO NOT CHANGE THIS !)
end

	if inflictor and killme_users[inflictor.name] >= s_killmestack_counter then -- print("**  Limit reached, max 10 killme's on this server **");
		killme_users[inflictor.name] = s_killmestack_counter -- max stack a player can use with killme
		ChatManager:SendMessage(('*** LIMIT REACHED *** : ' ..t_killmestack_counter ) , inflictor) -- ;  
		if inflictor then message_users[inflictor.name]=(message_users[inflictor.name])+1  -- (DO NOT CHANGE THIS !)
	end
	end
end)


Events:Subscribe('Player:Respawn', function(player, recipientMask, message,info,yell)
-- avoid getting a nil isue when making a kill		
		if addup_users[player.name] == nil then addup_users[player.name] = 1 ; end -- (DO NOT CHANGE THIS !)
		if killme_users[player.name] == nil then killme_users[player.name] = s_killme_counter ; end
		if message_users[player.name] == nil then message_users[player.name] = 1 ; end -- (DO NOT CHANGE THIS !)
end)
--	

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == "!killme" then

		if killme_users[player.name] == 1 then ChatManager:SendMessage(('Sorry, thats it ' ) , player) -- Default message when all !killme are used.
		else do

		ChatManager:SendMessage(( (spawnmessagetable[killme_users[player.name]]) ), player)
	RCON:SendCommand('admin.killPlayer', {player.name})
	killme_users[player.name]=(killme_users[player.name])-1 -- (DO NOT CHANGE THIS !)
	message_users[player.name]=1 -- this should do it -- (DO NOT CHANGE THIS !)

	if addup_users[player.name] >= 1 then addup_users[player.name] = 1 ; end -- (DO NOT CHANGE THIS !)

end
end

--
	elseif message == "//left" then
		if killme_users[player.name] == nil then killme_users[player.name] = s_killme_counter ; end
 	ChatManager:SendMessage(('Killme Commands left to use : '  ..killme_users[player.name]-1   ) , player)  

end
end)

Events:Subscribe('Level:Destroy', function()
	killme_users = {}
	announcedPlayers = {}
	addup_users = {}
	message_users = {}
	end) 

	Events:Subscribe('Player:Left', function(player)
-- This should reset  player data to spawn data when they rejoin
	addup_users[player.name] = 1 -- (DO NOT CHANGE THIS !)
	killme_users[player.name] = s_killme_counter
	announcedPlayers[player.name] = false
	message_users[player.name] = {}
	end) 
  
end -- statement used for the config.lua 
