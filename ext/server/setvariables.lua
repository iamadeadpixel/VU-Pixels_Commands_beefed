








-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** set variables loaded ***");
	end
	end
end)

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
-- This code is ripped from the ingameadmin mod
	if message == '' or player == nil then
		return
	end

	-- lowerkey the message
	message = message:lower()
	
	-- split the message into parts
	local s_Parts = message:split(' ')
	
	-- check if the first key is not a "!"
	if s_Parts[1]:sub(1,1) ~= "." then
		return
	end
	-- only if it starts with "." we go on

	if s_Parts[1] == '.set' then print ("we found the '.set' command") 

	fetchadmin(player, data_playername)
	if player.name == selected_admin then

	if s_Parts[2] == nil then
		ChatManager:SendMessage("Error: We need a value here", player)
		ChatManager:SendMessage("Valid values are: tban, rban", player)
			   print ("Error: We need a value here")
			   print ("Valid values are: tban, rban")
		end
	
	if s_Parts[2] == nil then return end -- if we dont use this when no name is given, the stuff below will gives a error message
	if s_Parts[2] == 'tban' then
    settban(s_Parts,SendMessage,player)

    elseif s_Parts[2] == 'rban' then
    setrban(s_Parts,SendMessage,player)

	elseif s_Parts[2] ~= "tban" or s_Parts[2] ~= "rban" then
		ChatManager:SendMessage("Error: Valid values are: tban / rban", player)
				 print ("Error: Valid values are: tban / rban")

--end
end
end
end
end)

function settban(s_Parts,SendMessage,player)

    print ("Tban selected:")
	if s_Parts[3] == nil or s_Parts[3] == "?" then
		ChatManager:SendMessage("Error: We need a value here", player)
		ChatManager:SendMessage("Valid values are: 1h,4h,8h,12h,1d,4d,1w,2w,1m", player)
			   print ("Error: We need a value here")
			   print ("Valid values are: 1h,4h,8h,12h,1d,4d,1w,2w,1m")
		end

	if s_Parts[3] == nil then return end -- if we dont use this when no name is given, the stuff below will gives a error message

	if s_Parts[3] == '1h' then
	ChatManager:SendMessage("Setting Timeban to 1 hour", player)
			 print ("Setting Timeban to 1 hour")
	s_timeban = 3600

	elseif s_Parts[3] == '4h' then
	ChatManager:SendMessage("Setting Timeban to 4 hour", player)
			 print ("Setting Timeban to 4 hour")
	s_timeban = 14400

	elseif s_Parts[3] == '8h' then
	ChatManager:SendMessage("Setting Timeban to 8 hour", player)
			 print ("Setting Timeban to 8 hour")
	s_timeban = 28800

	elseif s_Parts[3] == '12h' then
	ChatManager:SendMessage("Setting Timeban to 12 hour", player)
			 print ("Setting Timeban to 12 hour")
	s_timeban = 43200

	elseif s_Parts[3] == '1d' then
	ChatManager:SendMessage("Setting Timeban to 1 day", player)
			 print ("Setting Timeban to 1 day")
	s_timeban = 86400

	elseif s_Parts[3] == '4d' then
	ChatManager:SendMessage("Setting Timeban to 4 days", player)
			 print ("Setting Timeban to 4 days")
	s_timeban = 345600

	elseif s_Parts[3] == '1w' then
	ChatManager:SendMessage("Setting Timeban to 1 week", player)
			 print ("Setting Timeban to 1 week")
	s_timeban = 604800

	elseif s_Parts[3] == '2w' then
	ChatManager:SendMessage("Setting Timeban to 2 weeks", player)
			 print ("Setting Timeban to 2 weeks")
	s_timeban = 1209600

	elseif s_Parts[3] == '1m' then
	ChatManager:SendMessage("Setting Timeban to 1 month", player)
			 print ("Setting Timeban to 1 month")
	s_timeban = 2419200

end

end -- End of function call


function setrban(s_Parts,SendMessage,player)

	ChatManager:SendMessage("Rban selected:", player)
			 print ("Rban selected:")

	if s_Parts[3] == nil or s_Parts[3] == "?" then
		ChatManager:SendMessage("Error: We need a value here", player)
		ChatManager:SendMessage("Valid values are: 2 to 10", player)
			   print ("Error: We need a value here")
			   print ("Valid values are: 2 to 10")
		end

	if s_Parts[3] == nil then return end -- if we dont use this when no name is given, the stuff below will gives a error message

	s_Parts[3] = ((s_Parts[3]):gsub("[^1234567890]", ""))

    number = tonumber(s_Parts[3])
    number = math.abs(number)

    if number <= 10 then
    if number == 0 or number == 1 then 
    
	ChatManager:SendMessage("Sorry, values from 2 to 10 only please", player)
			 print ("Sorry, values from 2 to 10 only please")

        else
	ChatManager:SendMessage("Setting Roundban to "..number.." rounds", player)
			 print ("Setting Roundban to "..number.." rounds")
	s_roundban = tostring(number)
end
    else
	ChatManager:SendMessage("Sorry, values from 2 to 10 only please", player)
			 print ("Sorry, values from 2 to 10 only please") 
    end

end -- end of function call

