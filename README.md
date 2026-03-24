## "Authors": iamadeadpixel

mandatory:
change the content of config.lua

header = true
wil spam in the console the lua files for each section
set to false for no console messages

content from selected:
if you have 4 vu players on your account
place them there
or, add more trusted players in it.
(Not recomended, add only FULLY trusted players)

Commands:
How to use.
.ban <part of name> (this wil ban a player with a default message)
.ban <part of name> <message> (this wil ban a player with a custom message)

.tban <part of name> (this wil timeban a player with a default message for 1 day)
.tban <part of name> <message> (this wil timeban a player with a custom message for 1 day)

.rban <part of name> (this wil roundban a player with a default message for 2 rounds)
.rban <part of name> <message> (this wil roundban a player with a custom message for 2 rounds)


This is usefull if u want to change the timeban length, and roundban round.
Default: 1 day time ban
Valid values are: 1h,4h,8h,12h,1d,4d,1w,2w,1m
.set tban <value>

values from 2 to 10 are defined
Default: 2 rounds ban
.set rban <value>
These wil be reset on server restart only


.kick <part of name> (this wil kick a player with a default message)
.kick <part of name> <message> (this wil kick a player with a custom message)

Comment: Even bots will be killed !
.kill <part of name> (this wil kill a player with a default message)
.kill <part of name> <message> (this wil kill a player with a custom message)


.reboot (This wil reboot the server with a 10 seconds countdown)
.nextmap (This forward the server to the next map in list)
.reload (This wil reload the current running map)


Comment: A basic security is build in to check what gamemode is active.
.nuke (Instant nukeing the whole server with NO countdown)
.nuke all (Nukeing the whole server with 10 seconds countdown)
.nuke ru (Nukeing the russian team with 10 seconds countdown)
.nuke us (Nukeing the american team with 10 seconds countdown)


For squad deathmatch only
.nuke alpha (Nukeing the american team with 10 seconds countdown)
.nuke bravo (Nukeing the american team with 10 seconds countdown)
.nuke charlie (Nukeing the american team with 10 seconds countdown)
.nuke delta (Nukeing the american team with 10 seconds countdown)


For Rush / squad rush only
.nuke atackers (Nukeing the atackers team with 10 seconds countdown)
.nuke defenders (Nukeing the defenders team with 10 seconds countdown)


.swap ru (Admin self move to the Russian team)
.swap us (Admin self move to the American team)


.win us (Selecting the american team as winner, and end round)
.win ru (Selecting the russian team as winner, and end round)

.swap all (starts a countdown timer, and swap out both teams to the other sides)

Comment: Even bots will be moved !
Comment: Depending on game mode
Comment: Normal gamemodes - values are (US / RU)
Comment: Rush gamemode - values are (ATACKERS / DEFENDERS)
Comment: Squad Deathmatch - values are (ALPHA / BRAVO / CHARLIE / DELTA)
.move <part of name> <team value> (this wil move a player with a default message)
.move <part of name> <team value> <message> (this wil move a player with a custom message)
Example: .move pix us / .move pix us <your message here>




Comment: Used for testing only
.teamid (Prints all team id's)
.dump (Prints players based on team ID)
.guid (Prints players guid)

