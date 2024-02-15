local screenWidth, screenHeight = guiGetScreenSize()
local windowWidth, windowHeight = 300, 100
local windowX, windowY = (screenWidth - windowWidth) / 2, (screenHeight - windowHeight) / 2
local mainWindow

function createGUIWindow()
    mainWindow = guiCreateWindow(windowX, windowY, windowWidth, windowHeight, "Orbit Framework - Rychlá nastavení", false)

    checkbox1 = guiCreateCheckBox(20, 20, 260, 30, "Vytvořit výchozí frakce", false, false, mainWindow)
    checkbox2 = guiCreateCheckBox(20, 40, 260, 30, "Vytvořit výchozí interiéry", false, false, mainWindow)

    local button = guiCreateButton(100, 65, 100, 30, "Vytvořit", false, mainWindow)
    addEventHandler("onClientGUIClick", button, handleButtonClick, false)
end

function handleButtonClick()
    local isChecked1 = guiCheckBoxGetSelected(checkbox1)
    local isChecked2 = guiCheckBoxGetSelected(checkbox2)

    triggerServerEvent("onSetupButtonClicked", localPlayer, isChecked1, isChecked2)

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

