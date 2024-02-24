	if Config.updatecheck then 

require('version') -- under normal conditions use this.

-- This line contains the message if the mod.json is the same on github ,as is the version.lua localy on your server
s_current = ("VU-Pixels_Tickets seems to be up2date")

-- This line contains the message if the mod.json is the difrent on github ,as is the version.lua localy on your server
s_update = ("VU-Pixels_Tickets seems to be out of date!")

-- Make sure this point on github to your mod.json file !
-- Example: s_githublink = ("https://raw.githubusercontent.com/-username-/-modname-/main") 
s_githublink = ("https://github.com/iamadeadpixel/VU-Pixels_Commands_beefed/tree/main")


function getCurrentVersion()
    options = HttpOptions({}, 10);
    options.verifyCertificate = false; --ignore cert for wine users
  -- Make sure you paste the SAME link in s_githublink variable !
  res = Net:GetHTTP("https://raw.githubusercontent.com/iamadeadpixel/VU-Pixels_Commands_beefed/main/mod.json", options);
    if res.status ~= 200 then
        return null;
    end
    json = json.decode(res.body);
    return json.Version,json.Reason;
end


function checkVersion()
    if getCurrentVersion() ~= localModVersion then

_ModVersion = false
	print("***************************************");
        print('** '..s_update..' **' );
        print('** Please visit '..s_githublink..''  );
	print('** Changed Version on github is ('..json.Version..') - Local version:('..localModVersion..')')
	print('** Reason for update: ('..json.Reason..')')
	print("***************************************");
	else
_ModVersion = true
	print("***************************************");
        print('** '..s_current..' **' );
	print('Version on github is ('..json.Version..') - Local version:('..localModVersion..')...')
	print("***************************************");
    end
end

checkVersion();

    Events:Subscribe('Player:Chat', function(player, recipientMask, message)

if message == "@mod check" then

            if (_ModVersion) == (true) then
      ChatManager:SendMessage (''..s_current..'');
      ChatManager:SendMessage ('Version on github is ('..json.Version..') - Local version:('..localModVersion..')')

	else
	    if (_ModVersion) == (false) then
      ChatManager:SendMessage (''..s_update..'');
      ChatManager:SendMessage ('Version on github is ('..json.Version..') - Local version:('..localModVersion..')')
      ChatManager:SendMessage ('Reason for update ('..json.Reason..')')

end
end
end
end)

end

