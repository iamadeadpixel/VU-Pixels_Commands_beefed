-- Here you can turn on, or off modules.

Config = {
	funstuff = true, -- When active, it spams out comments when typing sertain words
	roundtime = true, -- When active, !rt or !roundtime spams out the running round time on the active round.
	Killme = true,  -- Hard limit is 3, but you can gain up to max 10. (depend on gamemode) - needs some tweaks
	kickme = true,  -- Enables or disables the !kickme modules, when enabled,it spams a random message when using !kickme (random out of 344 lines)
	banme = true,   -- Enables or disables the !banme modules, when enabled,a player can ban him self permanent from the server
	balance = true, -- Enables or disables the !balance module
	consolespam = true -- Turns on or off the console spam for the data_loader.lua module
}


--[[
Put playernames here who cannot use the !banme command
Most of time this should be server admins, and trusted players
]]

whitelist = {
	"iamadeadpixel",
	"[UKF]Pixel",
	"The male karen",
	"The Swedish Cook"
}
