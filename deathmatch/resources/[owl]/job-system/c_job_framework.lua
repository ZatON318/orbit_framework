job = 0
localPlayer = getLocalPlayer()

function playerSpawn()
	local logged = getElementData(localPlayer, "loggedin")

	if (logged==1) then
		job = tonumber(getElementData(localPlayer, "job"))
		if (job==1) then -- TRUCKER
			--exports["job-system-trucker"]:displayTruckerJob()
		else
			--exports["job-system-trucker"]:resetTruckerJob()
		end
		
		if (job==2) then -- TAXI
			displayTaxiJob()
		else
			resetTaxiJob()
		end
		
		if (job==3) then -- BUS
			displayBusJob()
		else
			resetBusJob()
		end
	end
end
addEventHandler("onClientPlayerSpawn", localPlayer, 
	function()
		setTimer(playerSpawn, 1000, 1)
	end
)

function quitJob(job)
	if (job==1) then -- Kurýr
		--exports["job-system-trucker"]:resetTruckerJob()
		outputChatBox("Dal jsi výpověď", 0, 255, 0)
	elseif (job==2) then -- Řidič taxíku
		resetTaxiJob()
		outputChatBox("Dal jsi výpověď", 0, 255, 0)
	elseif (job==3) then -- Řidič autobusu
		resetBusJob()
		outputChatBox("Dal jsi výpověď", 0, 255, 0)
	elseif (job==4) then -- Údržba města
		outputChatBox("Dal jsi výpověď", 0, 255, 0)
		triggerServerEvent("cancelCityMaintenance", localPlayer)
	elseif (job==5) then -- MECHANIC
		outputChatBox("Dal jsi výpověď", 0, 255, 0)
	elseif (job==6) then -- Elektrikář
		outputChatBox("Dal jsi výpověď", 0, 255, 0)
	end
end
addEvent("quitJob", true)
addEventHandler("quitJob", getLocalPlayer(), quitJob)
