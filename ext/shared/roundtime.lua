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
		print("Total playtime on roundover: " .. chat_PlayTime)
	end)

	-- -----------------------

	Events:Subscribe('Player:Chat', function(player, recipientMask, message)
		if message == "!rt" then
			session_playtime_current = os.time()
			session_playtime_total = os.difftime(session_playtime_current, session_playtime_start)
			session_playtime_total = math.floor(session_playtime_total)

			seconds = session_playtime_total
			hours = tostring(string.format(math.floor(seconds / 3600)));
			mins = tostring(string.format(math.floor(seconds / 60 - (hours * 60))));
			secs = tostring(string.format(math.floor(seconds - hours * 3600 - mins * 60)));

			roundtime_spammer(message, SendMessage, player)
		end
	end)


	function roundtime_spammer(message, SendMessage, player)
		if hours == "0" then
			chat_PlayTime = mins .. " minutes " .. secs .. " seconds"
			print("Round time elapsed: " .. chat_PlayTime)
			ChatManager:SendMessage("Round time elapsed: " .. chat_PlayTime, player)
		elseif hours >= "1" then
			chat_PlayTime = hours .. " hours " .. mins .. " minutes " .. secs .. " seconds"
			print("Round time elapsed: " .. chat_PlayTime)
			ChatManager:SendMessage("Round time elapsed: " .. chat_PlayTime, player)
		end
	end -- End fucntion call

	--[[

	









]]
end -- statement used for the config.lua
