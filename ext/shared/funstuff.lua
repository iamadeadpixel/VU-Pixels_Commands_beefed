-- Welcome to the magic world of spaghetti coding.

if Config.funstuff then 
	print("**** Funstuff is active ****"); 

	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end
end)

-- ---------------------------------------------------------------------

Events:Subscribe('Player:Chat', function(player, recipientMask, message)

	ss_message = (string.match(message, "auch"))
	if ss_message == "auch" then
	  ChatManager:SendMessage("Need a medic ?",player)
	end

-- -------------------------------

	ss_message = (string.match(message, "noob"))
	if ss_message == "noob" or ss_message == "n00b" then
	  ChatManager:SendMessage("noobs with boobs?",player)
	end

-- -------------------------------

	ss_message = (string.match(message, "lockdown"))
	if ss_message == "lockdown" then
	  ChatManager:SendMessage("Ya, lockdown, now trow away the keys",player)
	end

-- -------------------------------

	ss_message = (string.match(message, "camp"))
	if ss_message == "camp" then
	  ChatManager:SendMessage("Camping is lame, but not forbidden",player)
	end

-- -------------------------------

	ss_message = (string.match(message, "hello"))
	if ss_message == "hello" then
	  ChatManager:SendMessage("Heya "..player.name,player)
	end

-- -------------------------------

	ss_message = (string.match(message, "lol"))
	if ss_message == "lol" then
	ChatManager:SendMessage("hehe, ya, funny.",player)
	end

-- -------------------------------

	ss_message = (string.match(message, "corona"))
	if ss_message == "corona" then
	  ChatManager:SendMessage("That beer sucks like the virus",player)
	end

-- -------------------------------

	ss_message = (string.match(message, "covid"))
	if ss_message == "covid" then
	  ChatManager:SendMessage("Hatchuu,, Oh damn "..player.name..",stay away !",player)
	end

-- -------------------------------

	ss_message = (string.match(message, "gg&bb"))
	if ss_message == "gg&bb" then
	  ChatManager:SendMessage("Thnxs for playing "..player.name..",see you soon.",player)
	end

-- -------------------------------

	ss_message = (string.match(message, "drama queen"))
	if ss_message == "drama queen" then
	  ChatManager:SendMessage("There is only one drama queen here",player)
	end

-- -------------------------------

	ss_message = (string.match(message, "dramaqueen"))
	if ss_message == "dramaqueen" then
	  ChatManager:SendMessage("There is only one drama queen here",player)
	end

-- -------------------------------

end)

-- ---------------------------------------------------------------------
-- Used for testing it on bots.
Events:Subscribe('Player:Respawn', function(player, recipientMask, message, info, yell, playerGuid, accountGuid)
	b_fetchplayername[player.name] = player.name
end)

-- This code is ripped from the ingameadmin mod
function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end -- end of function call
-- ---------------------------------------------------------------------
--[[
Events:Subscribe('Player:Chat', function(player, recipientMask, message)
-- This code is ripped from the ingameadmin mod
	if message == '' or player == nil then
		return
	end

	-- lowerkey the message
	message = message:lower()

    ss_message = (string.match(message, "lol"))
    if ss_message == "lol" then
        print ("We found the 'lol' string")
    
end

end)
]]
-- ---------------------------------------------------------------------
Events:Subscribe('Player:Chat', function(player, recipientMask, message)
-- This code is ripped from the ingameadmin mod
	if message == '' or player == nil then
		return
	end

	-- lowerkey the message
	message = message:lower()
	
	-- split the message into parts
	local s_Parts = message:split(' ')
	
	-- check if the first key is not a "." or "!"
	if s_Parts[1]:sub(1,1) ~= "!" then
		return
    end

	-- only if it starts with "!" we go on
	if s_Parts[1] == '!love' then
	message = "Love you guys, but i try own you anyways"
	link = "love"
	start(message,s_Parts,SendMessage,player)
    end

	if s_Parts[1] == '!kleenex' then
	message = "Cry baby ! cry !!!!!"
	link = "kleenex"
	start(message,s_Parts,SendMessage,player)
    end

	if s_Parts[1] == '!wc' or s_Parts[1] == '!toilet' then
	message = "say ya baby !, you got the best shit place to camp !"
	link = "toilet"
	start(message,s_Parts,SendMessage,player)
    end

	if s_Parts[1] == '!abba' then
	message = "Singing ABBA's, dramaqueen"
	link = "abba"
	start(message,s_Parts,SendMessage,player)
    end

	if s_Parts[1] == '!britney' then
	message = "We are singing Britney Spears, Its Battlefield 3 BIATCH !!"
	link = "britney"
	start(message,s_Parts,SendMessage,player)
    end

	if s_Parts[1] == '!cakepan' then
	message = "Hitting a random player till it sounds * boink *"
	link = "cakepan"
	start(message,s_Parts,SendMessage,player)
    end


--
end)

-- ---

-- Tricky stuff, this is called when a correct name is found in the playername table
function messages(message,s_Parts,SendMessage,player)

	if link == "love" then
	part2_message = "@}->-`-,--- Love you to "..targetplayer
	end
-- --
	if link == "kleenex" then
	part2_message = ""..player.name.." gives "..targetplayer.." some kleenex, stop crying u baby"
	end
-- --
	if link == "toilet" then
	part2_message = ""..player.name.." gives "..targetplayer.." toilet paper, nice camping spot bro"
	end
-- --
	if link == "abba" then
	part2_message = ""..targetplayer.." is singing ABBA, i am such a DRAMAQUEEN, I cant stop whining"
	end
-- --
	if link == "britney" then
	part2_message = ""..player.name.." is singing Britney Spears, oops i did it again "..targetplayer
	end
-- --
	if link == "cakepan" then
	part2_message = ""..player.name.." is hitting "..targetplayer.." with a cakepan, * boink * ,you like it ?"
	end






end -- End function call

-- ---------------------------------------------------------------------

function start(message,s_Parts,SendMessage,player)
--[[
[G] = Global spam, used in the console
[T] = Targetplayer message
[S] = Player who invoked the command
]]
	print ("System: "..s_Parts[1].." selected")

	if s_Parts[2] == nil then
	  ChatManager:SendMessage(message)
			   print (message)
		end
	
	if s_Parts[2] == nil then return end
	-- With no name given, we just spammed a global message,and it ends here.

	-- When a name is given, here we check if he/she/it/here is in the collected playertable
	for _, b_fetchplayer in pairs(b_fetchplayername) do
	if string.match(b_fetchplayer:lower(), s_Parts[2]:lower()) then
			targetplayer = b_fetchplayer
		end
	end


	-- If a valid name is found, whe send the message to the targetplayer and the player
	if targetplayer ~= nil then

	-- Here do some tricky shit when a name is used and found
	messages(message,s_Parts,SendMessage,player)

			print ("")
				 print ("[G] "..part2_message)
	 RCON:SendCommand("admin.say", {"[T] "..part2_message, "player", targetplayer})
		ChatManager:SendMessage("[S] "..part2_message, player)

			targetplayer = nil

		else
	-- If no name is found,we report it back to the player
			   print ("no matching playername found")
	  ChatManager:SendMessage("no matching playername found", player)
			targetplayer = nil

return
end

end -- End function call

-- ---------------------------------------------------------------------

end -- statement used for the config.lua 
