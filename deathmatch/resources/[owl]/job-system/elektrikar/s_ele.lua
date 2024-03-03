pos = {
    { 1992.8974609375, -1668.275390625, 13.546875},
    --[[{ 2009.8095703125, -1642.5791015625, 13.546875},
    { 2017.3115234375, -1603.625, 13.546875},
    { 2047.388671875, -1663.763671875, 13.539077758789},
    { 2097.880859375, -1692.8173828125, 13.554634094238},
    { 2110.6181640625, -1744.21875, 13.554714202881},
    { 2208.75, -1724.220703125, 13.417074203491},
    { 2261.6796875, -1742.5, 13.546875},
    { 2376.2705078125, -1703.4697265625, 13.62178897857},
    { 2292.5673828125, -1647.302734375, 14.900384902954}]]
}




function startServis(playerSource) 
    local randomIndex = math.random(1, #pos)
    triggerClientEvent("showServis", playerSource, pos[randomIndex])
end
addCommandHandler("servis", startServis)


function jobFinish(client)
    exports.global:giveMoney(client, 500)
end
addEvent( "onEleFinish", true )
addEventHandler( "onEleFinish", resourceRoot, jobFinish )