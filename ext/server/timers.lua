








-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** Timers loaded ***");
	end
	end
end)

-- -------------

s_nuke_starttimer_PUE00 = os.time()
s_nuke_timer_PUE00 = 2

Events:Subscribe('Player:Update', function(player, deltaTime)
	s_nuke_end_timer_PUE00 = os.time()
	s_nuke_elapsed_timer_PUE00 = os.difftime(s_nuke_end_timer_PUE00, s_nuke_starttimer_PUE00)
	s_nuke_elapsed_timer_PUE00 = math.floor(s_nuke_elapsed_timer_PUE00)
	if s_nuke_elapsed_timer_PUE00 >= s_nuke_timer_PUE00 then
	if start_nuke_timer_all == true then

			 print (timer_msg_1.." timer:"..nuke_countdown.." seconds left") 
	ChatManager:SendMessage(timer_msg_1.." timer:"..nuke_countdown.." seconds left")
	nuke_countdown = nuke_countdown - 1

	if nuke_countdown == 0 then 
	start_nuke_timer_all = false -- ensure it runs only 1 time

	if nuketype_reboot == true then reboot() ; end
	if nuketype_all == true then exterminate(player) ; end
	if nuketype_swap_all == true then swapteams(player) ; end
	if nuketype_us == true then exterminate_us(player) ; end
	if nuketype_ru == true then exterminate_ru(player) ; end

	if nuketype_alpha == true then exterminate_alpha(player) ; end
	if nuketype_bravo == true then exterminate_bravo(player) ; end
	if nuketype_charlie == true then exterminate_charlie(player) ; end
	if nuketype_delta == true then exterminate_delta(player) ; end

	if nuketype_defenders == true then exterminate_defenders(player) ; end
	if nuketype_atackers == true then exterminate_atackers(player) ; end

	trigger_nuke = false
		end

		s_nuke_starttimer_PUE00 = os.time()
	end
end
end)
