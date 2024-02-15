function onSubmitButtonClicked(frakcie, inty)
    if exports.integration:isPlayerAdmin( thePlayer ) then
        outputChatBox("Setting...")
        local handle = dbQuery(exports.mysql:getConn('mta'), "SELECT id FROM radio_stations WHERE id = ? and owner = ?", id, getElementData(player, 'account:id'))
        local result = dbPoll(handle, 10000)

        if frakcie then
            dbExec(exports.mysql:getConn('mta'), "INSERT INTO `factions` VALUES (3,'ZSLS',0,4,'14,15,','Welcome to the faction.','',NULL,NULL,20,40,0,0,0,0,'','0'),(1,'LSPD',0,2,'8,9,','Welcome to the faction.','',NULL,NULL,20,40,0,0,0,0,'','0'),(2,'LSFD',0,4,'10,11,','Welcome to the faction.','',NULL,NULL,20,40,0,0,0,0,'','0'),(4,'Government',0,3,'12,13,','Welcome to the faction.','',NULL,NULL,20,40,0,0,0,0,'','0');")
            dbExec(exports.mysql:getConn('mta'), "INSERT INTO `faction_ranks` VALUES (8,1,'Leader Rank','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',0,1,0),(9,1,'Default Rank','',1,0,0),(10,2,'Leader Rank','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',0,1,0),(11,2,'Default Rank','',1,0,0),(12,4,'Leader Rank','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',0,1,0),(13,4,'Default Rank','',1,0,0),(14,3,'Leader Rank','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',0,1,0),(15,3,'Default Rank','',1,0,0);")
            dbExec(exports.mysql:getConn('mta'), "INSERT INTO `mdc_groups` VALUES (1,'LSPD',1,1,1,1,1,1,1,0,1,1);")
        end
    end
end
addEvent("onSetupButtonClicked", true)
addEventHandler("onSetupButtonClicked", root, onSubmitButtonClicked)


function setupBegin(thePlayer, cmd)
	if exports.integration:isPlayerAdmin( thePlayer ) then
		triggerClientEvent(thePlayer, resName..":onSetupBegin", resourceRoot)
	end
end
addCommandHandler("setup", setupBegin, false, false)

