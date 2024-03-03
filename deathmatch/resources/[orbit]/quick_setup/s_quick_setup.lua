function onSubmitButtonClicked(frakcie, inty, vehs)
    if exports.integration:isPlayerHeadAdmin( source ) then
        iprint("Nastavujem server pomocou quick setup...")

        if frakcie then
            dbExec(exports.mysql:getConn('mta'), "INSERT INTO `factions` VALUES (3,'ZSLS',0,4,'14,15,','Welcome to the faction.','',NULL,NULL,20,40,0,0,0,0,'','0'),(1,'LSPD',0,2,'8,9,','Welcome to the faction.','',NULL,NULL,20,40,0,0,0,0,'','0'),(2,'LSFD',0,4,'10,11,','Welcome to the faction.','',NULL,NULL,20,40,0,0,0,0,'','0'),(4,'Vláda',0,3,'12,13,','Welcome to the faction.','',NULL,NULL,20,40,0,0,0,0,'','0');")
            dbExec(exports.mysql:getConn('mta'), "INSERT INTO `faction_ranks` VALUES (8,1,'Leader Rank','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',0,1,0),(9,1,'Default Rank','',1,0,0),(10,2,'Leader Rank','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',0,1,0),(11,2,'Default Rank','',1,0,0),(12,4,'Leader Rank','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',0,1,0),(13,4,'Default Rank','',1,0,0),(14,3,'Leader Rank','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',0,1,0),(15,3,'Default Rank','',1,0,0);")
            dbExec(exports.mysql:getConn('mta'), "INSERT INTO `mdc_groups` VALUES (1,'LSPD',1,1,1,1,1,1,1,0,1,1);")
        end

        if inty then
            dbExec(exports.mysql:getConn("mta"), "INSERT INTO `interiors` (x,y,z,`type`,owner,locked,cost,name,interior,interiorx,interiory,interiorz,dimensionwithin,interiorwithin,angle,angleexit,supplies,safepositionX,safepositionY,safepositionZ,safepositionRZ,disabled,lastused,deleted,deletedDate,createdDate,creator,isLightOn,keypad_lock,keypad_lock_pw,keypad_lock_auto,faction,protected_until,furniture,interior_id,tokenUsed,settings,address) VALUES(1481.0,-1770.86,18.7958,2,0,0,0,'Radnice',3,390.44,173.91,1008.38,0,0,90.0,178.264,'[ [ ] ]',NULL,NULL,NULL,NULL,0,'2024-02-22 22:16:12','0',NULL,'2024-02-17 23:43:45','zaton',0,NULL,NULL,NULL,0,NULL,1,12,0,NULL,NULL),(1110.98,-1795.65,16.5938,2,0,0,0,'DopravnÃ­ InspektorÃ¡t',3,390.44,173.91,1008.38,0,0,90.0,270.65,'[ [ ] ]',NULL,NULL,NULL,NULL,0,'2024-02-25 00:18:53','0',NULL,'2024-02-24 22:19:45','zaton',0,NULL,NULL,NULL,0,NULL,1,12,0,NULL,NULL);")
        end

        if vehs then
            dbExec(exports.mysql:getConn("mta"), "INSERT INTO `vehicles` (model,x,y,z,rotx,roty,rotz,currx,curry,currz,currrx,currry,currrz,fuel,`engine`,locked,lights,sirens,paintjob,hp,color1,color2,color3,color4,plate,faction,owner,job,tintedwindows,dimension,interior,currdimension,currinterior,enginebroke,items,itemvalues,Impounded,handbrake,safepositionX,safepositionY,safepositionZ,safepositionRZ,upgrades,wheelStates,panelStates,doorStates,odometer,headlights,variant1,variant2,descriptionadmin,description1,description2,description3,description4,description5,suspensionLowerLimit,driveType,deleted,deletedDate,chopped,stolen,lastUsed,creationDate,createdBy,trackingdevice,registered,show_plate,show_vin,paintjob_url,vehicle_shop_id,bulletproof,textures,business,protected_until,tokenUsed,settings,hotwired) VALUES(410,1098.343750,-1772.612305,13.005231,0.000000,0.000000,90.000000,1089.518555,-1739.323242,13.171656,358.648682,0.373535,98.003540,40,1,0,1,0,0,1000.0,'[ [ 0, 0, 0 ] ]','[ [ 0, 0, 0 ] ]','[ [ 0, 0, 0 ] ]','[ [0, 0, 0] ]','TN1 2550',-1,-2,-2,0,0,0,0,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,'[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0, 0, 0 ] ]',3272,'[ [ 255, 255, 255 ] ]',255,255,NULL,'','','','','',NULL,NULL,0,NULL,0,0,'2024-02-25 00:19:01','2024-02-24 23:47:15',2,NULL,1,1,1,NULL,NULL,0,'[ [ ] ]',-1,NULL,0,NULL,0),(410,1098.794922,-1763.846680,13.000241,0.000000,0.000000,90.000000,1098.794922,-1763.846680,13.340241,0.000000,0.000000,90.000000,45,0,0,1,0,0,1000.0,'[ [ 0, 0, 0 ] ]','[ [ 0, 0, 0 ] ]','[ [ 0, 0, 0 ] ]','[ [0, 0, 0] ]','NO2 7977',-1,-2,-2,0,0,0,0,0,0,NULL,NULL,0,1,NULL,NULL,NULL,NULL,'[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0, 0, 0 ] ]',0,'[ [ 255, 255, 255 ] ]',255,255,NULL,'','','','','',NULL,NULL,0,NULL,0,0,'2024-02-25 00:04:47','2024-02-24 23:47:27',2,NULL,1,1,1,NULL,NULL,0,'[ [ ] ]',-1,NULL,0,NULL,0),(410,1083.939453,-1766.773438,13.004982,0.000000,0.000000,274.000000,1083.939453,-1766.773438,13.354982,0.000000,0.000000,274.000000,45,0,0,1,0,0,1000.0,'[ [ 0, 0, 0 ] ]','[ [ 0, 0, 0 ] ]','[ [ 0, 0, 0 ] ]','[ [0, 0, 0] ]','UR1 7888',-1,-2,-2,0,0,0,0,0,0,NULL,NULL,0,1,NULL,NULL,NULL,NULL,'[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0, 0, 0 ] ]',0,'[ [ 255, 255, 255 ] ]',255,255,NULL,'','','','','',NULL,NULL,0,NULL,0,0,'2024-02-25 00:04:37','2024-02-24 23:47:31',2,NULL,1,1,1,NULL,NULL,0,'[ [ ] ]',-1,NULL,0,NULL,0),(410,1084.472656,-1772.549805,13.003852,0.000000,0.000000,274.000000,1084.472656,-1772.549805,13.343852,0.000000,0.000000,274.000000,45,0,0,1,0,0,1000.0,'[ [ 0, 0, 0 ] ]','[ [ 0, 0, 0 ] ]','[ [ 0, 0, 0 ] ]','[ [0, 0, 0] ]','JD7 2347',-1,-2,-2,0,0,0,0,0,0,NULL,NULL,0,1,NULL,NULL,NULL,NULL,'[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0, 0, 0, 0 ] ]','[ [ 0, 0, 0, 0, 0, 0 ] ]',0,'[ [ 255, 255, 255 ] ]',255,255,NULL,'','','','','',NULL,NULL,0,NULL,0,0,'2024-02-25 00:04:23','2024-02-24 23:47:33',2,NULL,1,1,1,NULL,NULL,0,'[ [ ] ]',-1,NULL,0,NULL,0);")
        end
    else
        iprint("not admin")
    end
end
addEvent("onSetupButtonClicked", true)
addEventHandler("onSetupButtonClicked", root, onSubmitButtonClicked)


function setupBegin(thePlayer, cmd)
	if exports.integration:isPlayerAdmin( thePlayer ) then
		triggerClientEvent(thePlayer, "onSetupBegin", thePlayer)
	end
end
addCommandHandler("setup", setupBegin, false, false)

