function displayEleJob()
	outputChatBox("#FF9933Použij příkaz #FF0000/servis#FF9933 a uvidíš na mapě pozice kde je třeba provést servis elektrického vedení.", 255, 194, 15, true)
end

local marker = nil
local col = nil
local blip = nil

function enterMarker (theElement, matchingDimension)
    if matchingDimension and theElement == localPlayer then
        showServisScreen()
    end
end

function exitMarker( theElement, matchingDimension )
    if matchingDimension and theElement == localPlayer then
        hideServisScreen()
    end
end


function showServis(pos)
    outputChatBox(pos)
    marker = createMarker(pos[1], pos[2], pos[3]-0.8, "cylinder", 2, 219, 164, 37, 150)
    col = createColSphere(pos[1], pos[2], pos[3]-0.8, 2)
    blip = createBlip(pos[1], pos[2], pos[3], 0, 3, 219, 164, 37)
    addEventHandler ("onClientColShapeHit", col, enterMarker)
    addEventHandler("onClientColShapeLeave", col, exitMarker)
end
addEvent("showServis", true)
addEventHandler("showServis", root, showServis)


local showingGame = false

local screenWidth, screenHeight = guiGetScreenSize()

local boxW = 400
local boxH = 400
local connecting = 0

local mouseX = nil
local mouseY = nil

local points = {
    {screenWidth/2 - boxW/2, screenHeight/2 - boxH/2 + 10},
    {screenWidth/2 - boxW/2, screenHeight/2 - boxH/2 + 200},
    {screenWidth/2 - boxW/2, screenHeight/2 - boxH/2 + 360},
}

local endPoints = {
    {screenWidth/2 + boxW/2 - 30, screenHeight/2 - boxH/2 + 360},
    {screenWidth/2 + boxW/2 - 30, screenHeight/2 - boxH/2 + 10},
    {screenWidth/2 + boxW/2 - 30, screenHeight/2 - boxH/2 + 200},
}

local connection = {false, false, false}
local connected_points = 0

function renderConnectPoints()
    --local backg = dxDrawRectangle ( screenWidth/2 - boxW/2, screenHeight/2 - boxH/2, boxW, boxH, tocolor ( 39, 42, 43, 255 ) )
    
	local backg = dxDrawImage ( screenWidth/2 - boxW/2, screenHeight/2 - boxH/2, boxW, boxH, 'elektrikar/elekrab.jpg' )

    local pos1 = dxDrawRectangle ( points[1][1], points[1][2], 30, 30, tocolor ( 211, 195, 23, 255 ) )
    dxDrawText ( "PE", points[1][1] + 35, points[1][2], screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 2, "arial" )
    local pos2 = dxDrawRectangle ( points[2][1], points[2][2], 30, 30, tocolor ( 15, 81, 173, 255 ) )
    dxDrawText ( "N", points[2][1] + 35, points[2][2], screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 2, "arial" )
    local pos3 = dxDrawRectangle ( points[3][1], points[3][2], 30, 30, tocolor ( 84, 65, 30, 255 ) )
    dxDrawText ( "L", points[3][1] + 35, points[3][2], screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 2, "arial" )

    local endPos1 = dxDrawRectangle ( endPoints[1][1], endPoints[1][2], 30, 30, tocolor ( 211, 195, 23, 255 ) )
    local endPos2 = dxDrawRectangle ( endPoints[2][1], endPoints[2][2], 30, 30, tocolor ( 15, 81, 173, 255 ) )
    local endPos3 = dxDrawRectangle ( endPoints[3][1], endPoints[3][2], 30, 30, tocolor ( 84, 65, 30, 255 ) )

    if connecting == 1 then
        line = dxDrawLine(points[1][1] + (30/2), points[1][2] + (30/2), mouseX, mouseY, tocolor(211, 195, 23), 10)
    elseif connecting == 2 then
        line = dxDrawLine(points[2][1] + (30/2), points[2][2] + (30/2), mouseX, mouseY, tocolor(15, 81, 173), 10)
    elseif connecting == 3 then
        line = dxDrawLine(points[3][1] + (30/2), points[3][2] + (30/2), mouseX, mouseY, tocolor(84, 65, 30), 10)
    end

    if connection[1] == true then
        dxDrawLine(points[1][1] + (30/2), points[1][2] + (30/2), endPoints[1][1] + (30/2), endPoints[1][2] + (30/2), tocolor(211, 195, 23), 10)
    end

    if connection[2] == true then
        dxDrawLine(points[2][1] + (30/2), points[2][2] + (30/2), endPoints[2][1] + (30/2), endPoints[2][2] + (30/2), tocolor(15, 81, 173), 10)
    end

    if connection[3] == true then
        dxDrawLine(points[3][1] + (30/2), points[3][2] + (30/2), endPoints[3][1] + (30/2), endPoints[3][2] + (30/2), tocolor(84, 65, 30), 10)
    end

    
end

function onMouseMove(_, _, absoluteX, absoluteY, _, _) 
    mouseX = absoluteX
    mouseY = absoluteY
end


function onClick(button, state, absoluteX, absoluteY)
    if button == "left" and state == "down" then
        for i = 1, #points do
            local x, y = points[i][1], points[i][2]
            if isCursorInRange(absoluteX, absoluteY, x - 5, y - 5, 30, 30) then
                if(connection[i] == false) then
                    connecting = i
                end
            end
        end
        if(connecting > 0) then
            for i = 1, #endPoints do
                local x, y = endPoints[i][1], endPoints[i][2]
                if isCursorInRange(absoluteX, absoluteY, x - 5, y - 5, 30, 30) then
                    if connecting == i then
                        connecting = 0
                        connection[i] = true
                        connected_points = connected_points + 1
                        if(connected_points == 3) then
                            miniGameFinished()
                        end
                    end
                end
            end
        end
    end
end

function isCursorInRange(x, y, bx, by, bwidth, bheight)
    return x >= bx and x <= bx + bwidth and y >= by and y <= by + bheight
end

local function shuffle(tbl)
    for i = #tbl, 2, -1 do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end

function showServisScreen()
    showingGame = true
    shuffle(points)
    shuffle(endPoints)

    connection = {false, false, false}
    connected_points = 0

    addEventHandler("onClientRender", root, renderConnectPoints)
    addEventHandler("onClientClick", root, onClick)
    addEventHandler("onClientCursorMove", root, onMouseMove)
    
end

function hideServisScreen()
    showingGame = false
    removeEventHandler("onClientRender", root, renderConnectPoints)
    removeEventHandler("onClientClick", root, onClick)
    removeEventHandler("onClientCursorMove", root, onMouseMove)
end

function miniGameFinished()
    hideServisScreen()
    destroyElement(marker)
    destroyElement(col)
    destroyElement(blip)
    triggerServerEvent ( "onEleFinish", resourceRoot, localPlayer )
end