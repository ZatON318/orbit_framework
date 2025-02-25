mysql = exports.mysql
local lockTimer = nil
chDimension = 125
chInterior = 3

-- CALL BACKS FROM CLIENT

function onEmploymentServer()
	exports.global:sendLocalText(source, "Jessie Smith says: Dobrý den, hledáte novou práci?", nil, nil, nil, 10)
	exports.global:sendLocalText(source, " *Jessie Smith předáva seznam s pracovními pozicemi " .. getPlayerName(source):gsub("_", " ") .. ".", 255, 51, 102)
end

addEvent("onEmploymentServer", true)
addEventHandler("onEmploymentServer", getRootElement(), onEmploymentServer)

function givePlayerJob(jobID)
	local charname = getPlayerName(source)
	local charID = getElementData(source, "dbid")
	mysql:query_free("UPDATE `characters` SET `job`='"..tostring(jobID).."' WHERE `id`='"..mysql:escape_string(charID).."' ")
	
	--if (jobID==4) then -- CITY MAINTENANCE
		--exports.global:giveItem(source, 115, "41:1:Spraycan", 2500)
		--outputChatBox("Use this spray to paint over the graffiti you find.", source, 255, 194, 14)
		--exports.anticheat:changeProtectedElementDataEx(source, "tag", 9, false)
		--mysql:query_free("UPDATE characters SET tag=9 WHERE id = " .. mysql:escape_string(getElementData(source, "dbid")) )
	--end
	fetchJobInfoForOnePlayer(source)
end
addEvent("acceptJob", true)
addEventHandler("acceptJob", getRootElement(), givePlayerJob)

function fetchJobInfo()
	if not charID then
		for key, player in pairs(getElementsByType("player")) do
			fetchJobInfoForOnePlayer(player)
		end
	end
end

function fetchJobInfoForOnePlayer(thePlayer)
	local charID = getElementData(thePlayer, "dbid")
	local jobInfo = mysql:query_fetch_assoc("SELECT `job` , `jobID`, `jobLevel`, `jobProgress`, `jobTruckingRuns` FROM `characters` LEFT JOIN `jobs` ON `id` = `jobCharID` AND `job` = `jobID` WHERE `id`='" .. tostring(charID) .. "' ")
	if jobInfo then
		local job = tonumber(jobInfo["job"])
		local jobID = tonumber(jobInfo["jobID"])
		if job and job == 0 then
			setElementData(thePlayer, "job", 0, true)
			setElementData(thePlayer, "jobLevel", 0 , true)
			setElementData(thePlayer, "jobProgress", 0, true)
			setElementData(thePlayer, "job-system-trucker:truckruns", 0, true)
			return true
		end
		
		if not jobID then
			mysql:query_free("INSERT INTO `jobs` SET `jobID`='"..tostring(job).."', `jobCharID`='"..mysql:escape_string(charID).."' ")
		end
	
		setElementData(thePlayer, "job", job, true)
		setElementData(thePlayer, "jobLevel", tonumber(jobInfo["jobLevel"]) or 1, true)
		setElementData(thePlayer, "jobProgress", tonumber(jobInfo["jobProgress"]) or 0, true)
		setElementData(thePlayer, "job-system-trucker:truckruns", tonumber(jobInfo["jobTruckingRuns"]) or 0, true)
	else
		outputDebugString("[Job system] fetchJobInfoForOnePlayer / DB error")
		return false
	end
end

function printJobInfo(thePlayer)
	outputChatBox("~-~-~-~-~-~-~-~-~-~Career Information~-~-~-~-~-~-~-~-~-~-~", thePlayer, 255, 194, 14)
	outputChatBox("Job: "..(getJobTitleFromID(getElementData(thePlayer, "job")) or "Unemployed") , thePlayer, 255, 194, 14)
	outputChatBox("Title/Level: "..(tonumber(getElementData(thePlayer, "jobLevel")) or "0") , thePlayer, 255, 194, 14)
	outputChatBox("Progress: "..(tonumber(getElementData(thePlayer, "jobProgress")) or "0") , thePlayer, 255, 194, 14)
	outputChatBox("~-~-~-~--~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-", thePlayer, 255, 194, 14)
end
addCommandHandler("myjob", printJobInfo)

function quitJob(source)
	local logged = getElementData(source, "loggedin")
	if logged == 1 then
		local job = getElementData(source, "job")
		if job == 0 then
			outputChatBox("You are currently unemployed.", source, 255, 0, 0)
		else
			local charID = getElementData(source, "dbid")
			mysql:query_free("UPDATE `characters` SET `job`='0' WHERE `id`='"..mysql:escape_string(charID).."' ")
			fetchJobInfoForOnePlayer(source)
			if job == 4 then
				exports.anticheat:changeProtectedElementDataEx(source, "tag", 1, false)
				mysql:query_free("UPDATE characters SET tag=1 WHERE id = " .. mysql:escape_string(charID) )
			end
			triggerClientEvent(source, "quitJob", source, job)
		end
	end
end
addCommandHandler("endjob", quitJob, false, false)
addCommandHandler("quitjob", quitJob, false, false)

-- PREVENT UNEMPLOYED PLAYER GETTING IN DRIVER SEAT OR JACKING JOB VEHICLES -- MAXIME
function startEnterVehJob(thePlayer, seat, jacked) 
	local vjob = tonumber(getElementData(source, "job")) or 0
	local job = getElementData(thePlayer, "job")
	local seat = getPedOccupiedVehicleSeat(thePlayer) or 0
	if vjob>0 and job~=vjob and seat == 0 and not (getElementData(thePlayer, "duty_admin") == 1) and not (getElementData(thePlayer, "duty_supporter") == 1) then
		if (vjob==1) then
			outputChatBox("You are not a delivery driver. Visit city hall to obtain this job.", thePlayer, 255, 0, 0)
		elseif (vjob==2) then
			outputChatBox("You are not a taxi driver. Visit city hall to obtain this job.", thePlayer, 255, 0, 0)
		elseif (vjob==3) then
			outputChatBox("You are not a bus driver. Visit city hall to obtain this job.", thePlayer, 255, 0, 0)
		end
		if isTimer(lockTimer) then
			killTimer(lockTimer)
			lockTimer = nil
		end
		setVehicleLocked(source, true)
		lockTimer = setTimer(setVehicleLocked, 5000, 1, source, false)
	end
end
addEventHandler("onVehicleStartEnter", getRootElement(), startEnterVehJob)

--[[ -- Removed by MAXIME  
function resetContract( thePlayer, commandName, targetPlayerName )
	if (exports.integration:isPlayerTrialAdmin(thePlayer) or exports.integration:isPlayerSupporter(thePlayer)) then
		if targetPlayerName then
			local targetPlayer, targetPlayerName = exports.global:findPlayerByPartialNick( thePlayer, targetPlayerName )
			if targetPlayer then
				if getElementData( targetPlayer, "loggedin" ) == 1 then
					local result = mysql:query_free("UPDATE characters SET jobcontract = 0 WHERE id = " .. mysql:escape_string(getElementData( targetPlayer, "dbid" )) .. " AND jobcontract > 0" )
					if result then
						outputChatBox( "Reset Job Contract for " .. targetPlayerName, thePlayer, 0, 255, 0 )
					else
						outputChatBox( "Failed to reset Job Contract Time.", thePlayer, 255, 0, 0 )
					end
				else
					outputChatBox( "Player is not logged in.", thePlayer, 255, 0, 0 )
				end
			end
		else
			outputChatBox( "SYNTAX: /" .. commandName .. " [player]", thePlayer, 255, 194, 14 )
		end
	end
end
--addCommandHandler("resetcontract", resetContract, false, false)
]]


--[[
 * ***********************************************************************************************************************
 * Copyright (c) 2015 OwlGaming Community - All Rights Reserved
 * All rights reserved. This program and the accompanying materials are private property belongs to OwlGaming Community
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * ***********************************************************************************************************************
 ]]
 
 function getJobTitleFromID(jobID)
	return exports["job-system"]:getJobTitleFromID(jobID)
end

function givePlayerJob(thePlayer, commandName, targetPlayer, jobID, jobLevel, jobProgress)
	jobID = tonumber(jobID)
	if exports.integration:isPlayerTrialAdmin(thePlayer) or exports.integration:isPlayerSupporter(thePlayer) then
		local jobTitle = getJobTitleFromID(jobID)
		if not (targetPlayer) then
			printSetJobSyntax(thePlayer, commandName)
			return
		else
			
			if jobTitle == "Unemployed" then
				jobID = 0
			end
			
			local targetPlayer, targetPlayerName = exports.global:findPlayerByPartialNick(thePlayer, targetPlayer)
			if targetPlayer then
				local logged = getElementData(targetPlayer, "loggedin")
				local username = getPlayerName(thePlayer)
				
				if (logged==0) then
					outputChatBox("Player is not logged in.", thePlayer, 255, 0, 0)
				else
					if (jobID==4) then -- CITY MAINTENANCE
						exports.global:giveItem(targetPlayer, 115, "41:1:Spraycan", 2500)
						outputChatBox("Use this spray to paint over the graffiti you find.", targetPlayer, 255, 194, 14)
						exports.anticheat:changeProtectedElementDataEx(targetPlayer, "tag", 9, true)
						mysql:query_free("UPDATE characters SET tag=9 WHERE id = " .. mysql:escape_string(getElementData(targetPlayer, "dbid")) )
					end
					
					mysql:query_free("UPDATE `characters` SET `job`='" .. mysql:escape_string(jobID) .. "' WHERE `id`='"..tostring(getElementData(targetPlayer, "dbid")).."' " )
					
					exports["job-system"]:fetchJobInfoForOnePlayer(targetPlayer)
					
					local hiddenAdmin = getElementData(thePlayer, "hiddenadmin")
					local adminTitle = exports.global:getPlayerAdminTitle(thePlayer)
					if hiddenAdmin == 0 then
						outputChatBox("Your job has been set to '" .. jobTitle .. "' by "..tostring(adminTitle) .. " " .. getPlayerName(thePlayer):gsub("_", " ") ..". ", targetPlayer, 0, 255,0)
					else
						outputChatBox("Your job has been set to '" .. jobTitle .. "' by a hidden admin. ", targetPlayer, 0, 255,0)
					end
					outputChatBox("You have set " .. targetPlayerName .. "'s job to '"..jobTitle.."'.", thePlayer)
				end
			end
		end
	end
end
addCommandHandler("setjob", givePlayerJob, false, false)

function printSetJobSyntax(thePlayer, commandName)
	outputChatBox("SYNTAX: /" .. commandName .. " [Player Partial Nick / ID] [Job ID, 0 = Unemployed]", thePlayer, 255, 194, 14)
	outputChatBox("ID#1: Delivery Driver", thePlayer)
	outputChatBox("ID#2: Taxi Driver", thePlayer)
	outputChatBox("ID#3: Bus Driver", thePlayer)
	outputChatBox("ID#4: City Maintenance", thePlayer)
	outputChatBox("ID#5: Mechanic", thePlayer)
	outputChatBox("ID#6: Locksmith", thePlayer)
	outputChatBox("ID#7: Long Haul Truck Driver", thePlayer)
end

function setjobLevel(thePlayer, commandName, target, level, progress )
	if exports.integration:isPlayerLeadAdmin(thePlayer) then
		if not target or not tonumber(level) or (tonumber(level) < 1) then
			outputChatBox( "SYNTAX: /" .. commandName .. " [player ID or Name] [Level] [Progress, optional]", thePlayer, 255, 194, 14 )
			return false
		end
		
		if not tonumber(progress) or (tonumber(progress) < 0) then
			progress = 0
		end
		
		level = math.floor(tonumber(level))
		local targetPlayer, targetPlayerName = exports.global:findPlayerByPartialNick(thePlayer, target)
			
		if not targetPlayer then
			outputChatBox("Player '"..target.."' not found.", thePlayer, 255,0,0)
			return false
		end
		
		jobID = getElementData(targetPlayer, "job")
		
		if jobID <=0 then
			outputChatBox("Player is currently unemployed, please use /setjob first.", thePlayer, 255,0,0)
			return false
		end
		
		local sucess, msg = setPlayerJobLevel(targetPlayer, jobID, level, progress)
		if (getPlayerName(thePlayer) ~= getPlayerName(targetPlayer)) then
			outputChatBox(msg, thePlayer, 255, 194, 14)
			outputChatBox(msg, targetPlayer, 255, 194, 14)
		else
			outputChatBox(msg, targetPlayer, 255, 194, 14)
		end
		
		if sucess then
			return true
		else
			return false
		end
	end
end
addCommandHandler("setjoblevel", setjobLevel, false, false)

function setPlayerJobLevel(targetPlayer, jobID, level, progress)
	if mysql:query_free("UPDATE `jobs` SET `jobLevel`='"..level.."', `jobProgress`='"..progress.."' WHERE `jobCharID`='"..getElementData(targetPlayer, "dbid").."' AND `jobID`='"..jobID.."' " ) then
		exports["job-system"]:fetchJobInfoForOnePlayer(targetPlayer)
		return true, getPlayerName(targetPlayer):gsub("_", " ").." now has '"..getJobTitleFromID(jobID).."' job (Level: "..level..", Progress: "..progress..")"
	else
		return false, "Database Error, please report as bug"
	end
end
