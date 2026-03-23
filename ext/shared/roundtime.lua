-- Welcome to the magic world of spaghetti coding.

if Config.roundtime then
	print("**** banme is active ****");

	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
		if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		end
	end)

	-- -----------------------

	Events:Subscribe('Level:Loaded', function()
		print("*** Level loaded,starting round timer **")
		session_playtime_start = os.time()
	end)

	-- -----------------------

	Events:Subscribe('Server:RoundOver', function(roundTime, winningTeam)
		session_playtime_end = os.time()
		session_playtime_total = os.difftime(session_playtime_end, session_playtime_start)
		session_playtime_total = math.floor(session_playtime_total)

		seconds = session_playtime_total
		hours = string.format(math.floor(seconds / 3600));
		mins = string.format(math.floor(seconds / 60 - (hours * 60)));
		secs = string.format(math.floor(seconds - hours * 3600 - mins * 60));
		chat_PlayTime = hours .. " hours " .. mins .. " minutes " .. secs .. " seconds"
		print("Total playtime on roundover:" .. chat_PlayTime)
	end)

	-- -----------------------

	Events:Subscribe('Player:Chat', function(player, recipientMask, message)
		if message == "!rt" then
			session_playtime_current = os.time()
			session_playtime_total = os.difftime(session_playtime_current, session_playtime_start)
			session_playtime_total = math.floor(session_playtime_total)
			--			ChatManager:SendMessage("Current round time elapsed:" .. session_playtime_total, player)
			--			print("Current playtime elapsed:" .. session_playtime_total)

			seconds = session_playtime_total
			hours = string.format(math.floor(seconds / 3600));
			mins = string.format(math.floor(seconds / 60 - (hours * 60)));
			secs = string.format(math.floor(seconds - hours * 3600 - mins * 60));
			chat_PlayTime = hours .. " hours " .. mins .. " minutes " .. secs .. " seconds"

			print("Current round time elapsed:" .. chat_PlayTime)
			ChatManager:SendMessage("Current round time elapsed:" .. chat_PlayTime, player)
		end
	end)

	--[[











]]
end -- statement used for the config.lua
