--[[ //Chaos
~=~=~=~=~=~= ORGANIZED REPORTS FOR OWL INFO =~=~=~=~=~=~
Name: The name to show once the report is submitted and in the F2 menu
Staff to send to: The Usergroup ID on the forums that you are sending the report to
Abbreviation: Used in the report identifier for the staff
r, g, b: The color for the report

I used the strings as the values instead of the keys, this way its easier for us to organize.
{NAME, { Staff to send to }, Abbreviation, r, g, b} ]]

reportTypes = {
    [1] = {"Problém s jiným hráčem", {18, 17, 64, 15, 14, 16}, "PLY", 214, 6, 6, "Použijte tento typ, pokud hlásíte hráče kvůli problému, který nastal."},
    [2] = {"Problém s interiérem", {18, 17, 64, 15, 14, 16}, "INT", 255, 126, 0, "Použijte tento typ, pokud máte problém s interiérem."},
    [3] = {"Problém s položkou", {18, 17, 64, 15, 14, 16}, "ITM", 255, 126, 0, "Použijte tento typ, pokud potřebujete vytvořit položky nebo cokoli souvisejícího s inventářem položek."},
    [4] = {"Obecná otázka", {30, 18, 17, 64, 15, 14, 16}, "SUP", 70, 200, 30, "Použijte tento typ, pokud máte nějaké otázky."},
    [5] = {"Problémy s vozidlem", {30, 18, 17, 64, 15, 14, 16}, "VEH", 255, 126, 0, "Použijte tento typ, pokud máte problém s vozidlem."},
    [6] = {"Žádosti o stavbu/important vozidla", {39, 43}, "VCT", 176, 7, 237, "Použijte tento typ pro kontaktování VCT."},
    [7] = {"Otázka ohledně skriptování", {32}, "ScrT", 148, 126, 12, "Použijte tento typ, pokud chcete kontaktovat tým skriptování."},
    [8] = {"Vloupání do vozidla", {14, 18, 17, 64, 15}, "VEH-BI", 255, 126, 0, "Použijte tento typ, pokud chcete nahlásit vloupání do vozidla."},
    [9] = {"Vloupání do interiéru", {14, 18, 17, 64, 15}, "INT-BI", 255, 126, 0, "Použijte tento typ, pokud chcete nahlásit vloupání do interiéru."},
    [10] = {"Problém s mapováním", {44, 28}, "MAP", 0, 150, 190, "Použijte tento typ, pokud máte problém se svým vlastním mapováním nebo potřebujete tým pro mapování."}
}


function getReportTypes( type )
	return type and reportTypes[type] or reportTypes
end

adminTeams = exports.integration:getAdminStaffNumbers()
auxiliaryTeams = exports.integration:getAuxiliaryStaffNumbers()
SUPPORTER = exports.integration:getSupporterNumber()

function getReportInfo(row, element)
	if not isElement(element) then
		element = nil
	end

	local staff = reportTypes[tonumber(row)][2]
	local players = getElementsByType("player")
	local vcount = 0
	local scount = 0


	for k,v in ipairs(staff) do
		if v == 39 or v == 43 then

			for key, player in ipairs(players) do
				if exports.integration:isPlayerVCTMember(player) or exports.integration:isPlayerVehicleConsultant(player) then
					vcount = vcount + 1
					save = player
				end
			end

			if vcount==0 then
				return false, "There is currently no VCT Members online. Contact them here: http://forums.owlgaming.net/forms.php?do=form&fid=42"
			elseif vcount==1 and save == element then -- Callback for checking if a aux staff logs out
				return false, "There is currently no VCT Members online. Contact them here: http://forums.owlgaming.net/forms.php?do=form&fid=42"
			end
		elseif v == 32 then

			for key, player in ipairs(players) do
				if exports.integration:isPlayerScripter(player) then
					scount = scount + 1
					save = player
				end
			end

			if scount==0 then
				return false, "There is currently no members of the Scripting team online. Use Support Center at www.owlgaming.net/support.php"
			elseif scount==1 and save == element then -- Callback for checking if a aux staff logs out
				return false, "There is currently no members of the Scripting team online. Use Support Center at www.owlgaming.net/support.php"
			end
		end
	end

	local name = reportTypes[row][1]
	local abrv = reportTypes[row][3]
	local red = reportTypes[row][4]
	local green = reportTypes[row][5]
	local blue = reportTypes[row][6]

	return staff, false, name, abrv, red, green, blue
end

function isSupporterReport(row)
	local staff = reportTypes[row][2]

	for k, v in ipairs(staff) do
		if v == SUPPORTER then
			return true
		end
	end
	return false
end

function isAdminReport(row)
	local staff = reportTypes[row][2]

	for k, v in ipairs(staff) do
		if string.find(adminTeams, v) then
			return true
		end
	end
	return false
end

function isAuxiliaryReport(row)
	local staff = reportTypes[row][2]

	for k, v in ipairs(staff) do
		if string.find(auxiliaryTeams, v) then
			return true
		end
	end
	return false
end

function showExternalReportBox(thePlayer)
	if not thePlayer then return false end
	return (exports.integration:isPlayerTrialAdmin(thePlayer) or exports.integration:isPlayerSupporter(thePlayer)) and (getElementData(thePlayer, "report_panel_mod") == "2" or getElementData(thePlayer, "report_panel_mod") == "3")
end

function showTopRightReportBox(thePlayer)
	if not thePlayer then return false end
	return (exports.integration:isPlayerTrialAdmin(thePlayer) or exports.integration:isPlayerSupporter(thePlayer)) and (getElementData(thePlayer, "report_panel_mod") == "1" or getElementData(thePlayer, "report_panel_mod") == "3")
end
