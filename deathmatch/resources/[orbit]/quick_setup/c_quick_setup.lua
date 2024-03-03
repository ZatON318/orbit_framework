local screenWidth, screenHeight = guiGetScreenSize()
local windowWidth, windowHeight = 400, 400
local windowX, windowY = (screenWidth - windowWidth) / 2, (screenHeight - windowHeight) / 2
local mainWindow

local factions = nil
local ints = nil
local vehs = nil

function createGUIWindow()
    mainWindow = guiCreateWindow(windowX, windowY, windowWidth, windowHeight, "Orbit Framework - Rychlá nastavení", false)

    factions = guiCreateCheckBox(20, 20, 260, 30, "Vytvořit výchozí frakce", false, false, mainWindow)
    ints = guiCreateCheckBox(20, 40, 300, 30, "Vytvořit výchozí inty pro Dop. inspektorat, Radnici", false, false, mainWindow)
    vehs = guiCreateCheckBox(20, 60, 260, 30, "Vytvořit výchozí vozidla pro autoškolu", false, false, mainWindow)
    --checkbox2 = guiCreateCheckBox(20, 40, 260, 30, "Vytvořit výchozí interiéry", false, false, mainWindow)

    local button = guiCreateButton(150, 350, 100, 50, "Vytvořit", false, mainWindow)
    addEventHandler("onClientGUIClick", button, handleButtonClick, false)
end

function handleButtonClick()
    outputConsole("clicked")
    local isFactions = guiCheckBoxGetSelected(factions)
    local isInts = guiCheckBoxGetSelected(ints)
    local isVehs = guiCheckBoxGetSelected(vehs)

    --outputConsole(isChecked1)
    --outputConsole(ints)
    --outputConsole(vehs)
    --local isChecked2 = guiCheckBoxGetSelected(checkbox2)

    triggerServerEvent("onSetupButtonClicked", localPlayer, isFactions, isInts, isVehs)

    guiSetVisible(mainWindow, false)  -- Hide the window after submission
end


function showSetup ( message )
    if not isElement(mainWindow) then
        createGUIWindow()
    end
    guiSetVisible(mainWindow, true)
end
addEvent( "onSetupBegin", true )
addEventHandler( "onSetupBegin", localPlayer, showSetup )

