addEvent("weaponDistrict:doDistrict", true)

function weaponDistrict_doDistrict(name)
	exports["chat-system"]:districtIC(client, _, "Slyšeli byste sérii hlasitých výstřelů z " .. name .. " ozývajících se v celém okolí")
end

addEventHandler("weaponDistrict:doDistrict", root, weaponDistrict_doDistrict)