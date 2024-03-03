--MAXIME
mysql = exports.mysql
TESTER = 25
SCRIPTER = 32
LEADSCRIPTER = 79
COMMUNITYLEADER = 14
TRIALADMIN = 18
ADMIN = 17
SENIORADMIN = 64
LEADADMIN = 15
SUPPORTER = 30
VEHICLE_CONSULTATION_TEAM_LEADER = 39
VEHICLE_CONSULTATION_TEAM_MEMBER = 43
MAPPING_TEAM_LEADER = 44
MAPPING_TEAM_MEMBER = 28
STAFF_MEMBER = {32, 14, 18, 17, 64, 15, 30, 39, 43, 44, 28}
AUXILIARY_GROUPS = {32, 39, 43, 44, 28}
ADMIN_GROUPS = {14, 18, 17, 64, 15}

staffTitles = {
	[1] = {
		[0] = "Hráč",
		[1] = "Pomocný Admin",
		[2] = "Admin",
		[3] = "Senior Admin",
		[4] = "Hlavný Admin",
		[5] = "Majitel"
	}, 
	[2] = {
		[0] = "Hráč",
		[1] = "Support",
		[2] = "Support Manager",
	}, 
	[3] = {
		[0] = "Hráč",
		[1] = "VT Member",
		[2] = "VCT",
	}, 
	[4] = {
		[0] = "Hráč",
		[1] = "Script Tester",
		[2] = "Trial Scripter",
		[3] = "Scripter",
	}, 
	[5] = {
		[0] = "Hráč",
		[1] = "Mapper",
		[2] = "Hlavný Mapper",
	}, 
	[6] = {
		[0] = "Hráč",
		[1] = "FT Member",
		[2] = "FT Leader",
	}
}

function getStaffTitle(teamID, rankID) 
	return staffTitles[tonumber(teamID)][tonumber(rankID)]
end

function getStaffTitles()
	return staffTitles
end