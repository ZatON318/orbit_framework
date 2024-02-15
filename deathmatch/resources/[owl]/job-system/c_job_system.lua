wEmployment, jobList, bAcceptJob, bCancel = nil


local jessie = createPed( 141, 1480.8994140625, -1790.9189453125, 18.861186981201 )
setPedRotation( jessie, 0 )
setElementDimension( jessie, 0 )
setElementInterior( jessie , 0 )
setElementData( jessie, "talk", 1, false )
setElementData( jessie, "name", "Jessie Smith", false )
--setPedAnimation ( jessie, "INT_OFFICE", "OFF_Sit_Idle_Loop", -1, true, false, false )
setElementFrozen(jessie, true)


function showEmploymentWindow()

	triggerServerEvent("onEmploymentServer", getLocalPlayer())
	local width, height = 300, 400
	local scrWidth, scrHeight = guiGetScreenSize()
	local x = scrWidth/2 - (width/2)
	local y = scrHeight/2 - (height/2)

	wEmployment = guiCreateWindow(x, y, width, height, "Volné pracovní pozice", false)

	jobList = guiCreateGridList(0.05, 0.05, 0.9, 0.8, true, wEmployment)
	local column = guiGridListAddColumn(jobList, "Pracovní pozice", 0.9)

	-- TRUCKER
	local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Kurýr", false, false)

	-- TAXI
	local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Řidič taxíku", false, false)

	-- BUS --
	local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Řidič autobusu", false, false)

	local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Údržba města", false, false)
	-- CITY MAINTENACE
	--if not exports.factions:isInFactionType(getLocalPlayer(), 2) then
		--local rowmaintenance = guiGridListAddRow(jobList)
		--guiGridListSetItemText(jobList, rowmaintenance, column, "Údržba města", false, false)
	--end

	-- CITY MAINTENACE
	--local rowmaintenance = guiGridListAddRow(jobList)
	--guiGridListSetItemText(jobList, rowmaintenance, column, "Údržba města", false, false)

	-- MECHANIC
	--[[local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Mechanic", false, false)]] -- Disabled, added mechanic faction type

	-- LOCKSMITH
	--[[local row = guiGridListAddRow(jobList)
	guiGridListSetItemText(jobList, row, column, "Locksmith", false, false)]]

	bAcceptJob = guiCreateButton(0.05, 0.85, 0.45, 0.1, "Přijmout práci", true, wEmployment)
	bCancel = guiCreateButton(0.5, 0.85, 0.45, 0.1, "Zrušit", true, wEmployment)

	showCursor(true)

	addEventHandler("onClientGUIClick", bAcceptJob, acceptJob)
	addEventHandler("onClientGUIDoubleClick", jobList, acceptJob)
	addEventHandler("onClientGUIClick", bCancel, cancelJob)
end
addEvent("onEmployment", true)
addEventHandler("onEmployment", getRootElement(), showEmploymentWindow)

function acceptJob(button, state)
	if (button=="left") then
		local row, col = guiGridListGetSelectedItem(jobList)
		local job = getElementData(getLocalPlayer(), "job")

		if (row==-1) or (col==-1) then
			outputChatBox("Nejprve si prosím vyberte práci!", 255, 0, 0)
		elseif (job>0) then
			outputChatBox("Jste již zaměstnáni, ukončete prosím nejprve své jiné zaměstnání (( /quitjob )).", 255, 0, 0)
		else
			local job = 0
			local jobtext = guiGridListGetItemText(jobList, guiGridListGetSelectedItem(jobList), 1)

			if ( jobtext=="Kurýr" or jobtext=="Řidič taxíku" or jobtext=="Řidič autobusu" ) then  -- Driving job, requires the license
				local carlicense = getElementData(getLocalPlayer(), "license.car")
				if (carlicense~=1) then
					outputChatBox("K této práci potřebujete řidičský průkaz.", 255, 0, 0)
					return
				end
			end

			if (jobtext=="Kurýr") then
				job = 1
				triggerEvent ( "displayDelivery", root )
			elseif (jobtext=="Řidič taxíku") then
				job = 2
				displayTaxiJob()
			elseif  (jobtext=="Řidič autobusu") then
				job = 3
				displayBusJob()
			elseif (jobtext=="Údržba města") then
				job = 4
				triggerEvent ( "displaySweeper", root )
			elseif (jobtext=="Mechanic") then
				displayMechanicJob()
				job = 5
			elseif (jobtext=="123456") then
				displayLocksmithJob()
				job = 6
			end

			triggerServerEvent("acceptJob", getLocalPlayer(), job)

			destroyElement(jobList)
			destroyElement(bAcceptJob)
			destroyElement(bCancel)
			destroyElement(wEmployment)
			wEmployment, jobList, bAcceptJob, bCancel = nil, nil, nil, nil
			showCursor(false)
		end
	end
end

function cancelJob(button, state)
	if (source==bCancel) and (button=="left") then
		destroyElement(jobList)
		destroyElement(bAcceptJob)
		destroyElement(bCancel)
		destroyElement(wEmployment)
		wEmployment, jobList, bAcceptJob, bCancel = nil, nil, nil, nil
		showCursor(false)
	end
end
