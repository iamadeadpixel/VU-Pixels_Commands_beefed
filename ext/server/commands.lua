








-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** Admin commands loaded ***");
	end
	end
end)

-- -------------

Events:Subscribe('Player:Chat', function(player, recipientMask, message)

	if message == ".reboot" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	reboot_timer(player)
end
end

-- -------------------------------

	if message == ".reload" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	reloadmap()
end
end

-- -------------------------------

	if message == ".nextmap" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nextmap()
end
end

-- -------------------------------

	if message == ".swap ru" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	swap_2ru(player)
end
end

-- -------------------------------

	if message == ".swap us" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	swap_2us(player)
end
end

-- -------------------------------

	if message == ".swap all" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	swapteams_timer(player)
end
end

-- -------------------------------

	if message == ".nuke" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	exterminate(player)
end
end

-- -------------------------------

	if message == ".nuke all" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_all(player)
end
end

-- -------------------------------

	if message == ".nuke us" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_us(player)
end
end

-- -------------------------------

	if message == ".nuke ru" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_ru(player)
end
end

-- -------------------------------

	if message == ".nuke alpha" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_alpha(player)
end
end

-- -------------------------------

	if message == ".nuke bravo" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_bravo(player)
end
end

-- -------------------------------

	if message == ".nuke charlie" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_charlie(player)
end
end

-- -------------------------------

	if message == ".nuke delta" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_delta(player)
end
end

-- -------------------------------

	if message == ".nuke atackers" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_atackers(player)
end
end

-- -------------------------------

	if message == ".nuke defenders" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_defenders(player)
end
end

-- -------------------------------

end)
