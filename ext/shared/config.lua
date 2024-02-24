-- Here you can turn on, or off modules.
-- Recomended is to use the modreload (procon) and reload the running map,OR restart the server.

Config = {
	-- ONLY	ONE CAN BE ACTIVE,OR NONE.....
	Killme_advanced = false, -- More advance, spams message, with a HARD limit (4) -- This version works 100%
	Killme_kinky = true, -- Kinky version, hard limit is 3, but you can gain up to max 10. -- needs some tweaks

	kickme = true, -- Enables or disables the !kickme modules, when enabled,it spams a random message when using !kickme (random out of 344 lines)
	balance = true, -- Enables or disables the !balance module

-- Checks if there is a updated version
	updatecheck = true, -- On server boot only: Shows if there is a new version

	chatmessages = true, -- Spams a one time message, Gamemode,levelname and ticket count in chat
	updatecheck = false, -- On server boot only: Shows if there is a new version
	morechoppers = false, -- Turns on or off infinate choppers for Heli Superiority (carefull !)
	consolespam = true -- Turns on or off the console spam

}

return Config
