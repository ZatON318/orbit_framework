all_plugins = {
	[1] = 	{"Kamionak",			"Plugin pro provozování kamionistické firmy",   0,  0},
	[2] = 	{"Delivery",			"Plugin pro kurýrskou firmu",                   1,  10000},
	[3] = 	{"Mechanik",		    "Plugin pro mechaniky na opravu a úpravu aut",  0,  0},
	[4] = 	{"Security",	        "Plugin Security pro SBS",                      1,  300000},
	--[5] = 	{"modify_factionl_note","Modify Faction Leader Note"},
	}



function getAllFactionPlugins(factionID)
    if (not factionID or type(factionID) ~= "number") then 
        return nil
    end
    
    local response = dbQuery(mysql:getConn("mta"), "SELECT `plugins` FROM `factions` WHERE `id` = ?;", factionID)
	local factionPlugins = dbPoll(response, -1)
    local factionPlugins = factionPlugins[1]["plugins"]
	dbFree(response)

    local response = dbQuery(mysql:getConn("mta"), "SELECT `active_plugins` FROM `factions` WHERE `id` = ?;", factionID)
	local activePlugins = dbPoll(response, -1)
    local activePlugins = activePlugins[1]["active_plugins"]
	dbFree(response)
    local activePlugins = split(activePlugins, ",")

    plugins = {}

    local factionPlugins = split(factionPlugins, ",")
	for i,pluginID in ipairs(factionPlugins) do
		local pluginID = tonumber(pluginID)
        plugins[i] = all_plugins[pluginID]
        plugins[i][3] = "Inactive"
        for y,activeID in ipairs(activePlugins)do
            activeID = tonumber(activeID)
            if(pluginID == activeID)then
                plugins[i][3] = "Active"
            end
        end
	end
    return plugins

end

function haveFactionPlugin(pluginID,factionID)
    local response = dbQuery(mysql:getConn("mta"), "SELECT `plugins` FROM `factions` WHERE `id` = ?;", factionID)
	local factionPlugins = dbPoll(response, -1)
    local factionPlugins = factionPlugins[1]["plugins"]
	dbFree(response)
    local factionPlugins = split(factionPlugins, ",")
    for i,plugID in ipairs(factionPlugins) do
		local plugID = tonumber(plugID)
        if(plugID == pluginID)then
            return true
        end
	end

    return false
end

function haveFactionActivePlugin(pluginID,factionID)
    if (not factionID or type(factionID) ~= "number") then 
        return nil
    end
    local response = dbQuery(mysql:getConn("mta"), "SELECT `active_plugins` FROM `factions` WHERE `id` = ?;", factionID)
	local factionPlugins = dbPoll(response, -1)
    local factionPlugins = factionPlugins[1]["active_plugins"]
	dbFree(response)
    local factionPlugins = split(factionPlugins, ",")
    for i,plugID in ipairs(factionPlugins) do
		local plugID = tonumber(plugID)
        if(plugID == pluginID)then
            return true
        end
	end

    return false
    
end

function isPlayerInFactionWithActivePlugin(pluginID, player)
    local state, playerFactions = getPlayerFactions(getPlayerName(player))
    for i,fac in pairs(playerFactions) do
        if(haveFactionActivePlugin(pluginID, i))then
            --iprint("faction " ..i.. " have active plugin " ..pluginID)
            return true
        end
	end
    return false
end



function getPluginFromName(pluginName)
    if (not pluginName) then 
        return nil
    end
    
    for i,plug in ipairs(all_plugins)do
        if(plug[1] == pluginName)then
            return i
        end
    end
    return nil
end

function getPlugins()
    return all_plugins
end


function setPluginActivity(pluginID, factionID)
    if (not factionID or type(factionID) ~= "number") then 
        return nil
    end

    if (not pluginID) then 
        return nil
    end
    
    if(haveFactionPlugin(pluginID, factionID))then
        local response = dbQuery(mysql:getConn("mta"), "SELECT `active_plugins` FROM `factions` WHERE `id` = ?;", factionID)
        local activePlugins = dbPoll(response, -1)
        local activePlugins = activePlugins[1]["active_plugins"]
        dbFree(response)

        local activePlugins = split(activePlugins, ",")
        for y,activeP in ipairs(activePlugins)do
            if(activeP == tostring(pluginID))then
                table.remove(activePlugins, y)
                local comma_separated_plugins = table.concat(activePlugins, ",")
                dbExec(mysql:getConn("mta"), "UPDATE `factions` SET `active_plugins` = ? WHERE `id` = ?;", comma_separated_plugins, factionID)
                return
            end
        end

        table.insert(activePlugins, tostring(pluginID))
        local numbers = {}
        for i, string_number in ipairs(activePlugins) do
            numbers[i] = tonumber(string_number)
        end
        table.sort(numbers)
        for i, number in ipairs(numbers) do
            activePlugins[i] = tostring(number)
        end

        local comma_separated_plugins = table.concat(activePlugins, ",")
        dbExec(mysql:getConn("mta"), "UPDATE `factions` SET `active_plugins` = ? WHERE `id` = ?;", comma_separated_plugins, factionID)
        return
    end
    
    return
end