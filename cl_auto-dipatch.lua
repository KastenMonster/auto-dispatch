--[[
    Sonaran CAD Plugins

    Plugin Name: template
    Creator: template
    Description: Describe your plugin here

    Put all client-side logic in this file.
]]

CreateThread(function() 
    Config.LoadPlugin("auto-dipatch", function(pluginConfig)

        if pluginConfig.enabled then
            
            RegisterNetEvent('km_autodispatch:CAddCall')
            AddEventHandler('km_autodispatch:CAddCall', function (caller,desc)
                local postalcode = exports['nearest-postal']:getPostal()
                local coords = GetEntityCoords(PlayerPedId())
                local name = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))

                local location = '['..postalcode..'] '..name
                TriggerServerEvent('km_autodispatch:AddCall',caller,postalcode,location,desc)
            end)
            
        end
    end) 
end)