--[[
* ***********************************************************************************************************************
* 2023 OwlGaming Community - All Rights Reserved
* All rights reserved. This program and the accompanying materials are private property belongs to OwlGaming Community
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
* ***********************************************************************************************************************
]]

-- You dont need to change anything here, if you want to connect your database
-- Go to settings.xml ( before the resources folder )
production = (get( "production_server" ) == "1" or false)
socket = get( "socket" ) or ""


hostname = get( "hostname" )
username = get( "username" )
password = get( "password" )
database = get( "database" )
port = tonumber( get( "port" ) )


local dbConns = {}

function createConnection(res, db)
	if ((db and db == "mta") or not db) and not dbConns.mta then
		dbConns.mta = dbConnect("mysql","dbname=".. database ..";host="..hostname..";port="..port..";"..socket, username, password, "autoreconnect=1")
		if dbConns.mta then
			if eventName then
				outputDebugString("[MYSQL] createConnection / "..database.." / OK")
			else
				connectToDatabase(res) -- Restart the connection for the MySQL Module
				outputDebugString("[MYSQL] reconnectConnection / "..database.." / OK")
			end
		else
			if eventName then
				cancelEvent(true, "Cannot connect to the database.")
				outputDebugString("[MYSQL] createConnection / "..database.." / FAILED")
			else
				outputDebugString("[MYSQL] reconnectConnection / "..database.." / FAILED")
			end
		end

		createMigrationsTable()
	elseif (db and db == "mta") and not dbConns.mta then
		dbConns.mta = dbConnect("mysql","dbname=".. database ..";host="..hostname..";port="..port..";"..socket, username, password, "autoreconnect=1")
		if dbConns.mta then
			if eventName then
				outputDebugString("[MYSQL] createConnection / "..database.." / OK")
			else
				outputDebugString("[MYSQL] reconnectConnection / "..database.." / OK")
			end
		else
			if eventName then
				cancelEvent(true, "Cannot connect to the database.")
				outputDebugString("[MYSQL] createConnection / "..database.." / FAILED")
			else
				outputDebugString("[MYSQL] reconnectConnection / "..database.." / FAILED")
			end
		end
	end

	if not eventName then
		return dbConns[db]
	end
end
addEventHandler("onResourceStart", resourceRoot, createConnection)

function getConn(db)
	if isElement(dbConns[db or 'mta']) then
		return dbConns[db or 'mta']
	else
		return createConnection(false, db or 'mta')
	end
end

function getSmallestID( table, index )
	index = index or 'id'
	return "(SELECT MIN(e1."..index.."+1) FROM "..table.." AS e1 LEFT JOIN "..table.." AS e2 ON e1."..index.." +1 = e2."..index.." WHERE e2."..index.." IS NULL)"
end
