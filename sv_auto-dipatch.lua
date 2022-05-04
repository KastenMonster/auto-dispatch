--[[
    Sonaran CAD Plugins

    Plugin Name: template
    Creator: template
    Description: Describe your plugin here

    Put all server-side logic in this file.
]]

CreateThread(function() Config.LoadPlugin("auto-dipatch", function(pluginConfig)

    if pluginConfig.enabled then

        RegisterServerEvent('km_autodispatch:AddCall')
        AddEventHandler('km_autodispatch:AddCall', function (caller,postal,location,desc)
            SendDisPatch(caller,postal,location,desc)
        end)

        function SendDisPatch(caller,postal,location,desc)
            -- Body payload object
        local payload = {
            id = pluginConfig.communityid,
            key = pluginConfig.apikey,
            type = "CALL_911",
            data = {
                {
                    serverId = 1, -- Default 1 - See guide on setting up multiple servers
                    isEmergency = true,
                    caller = caller,
                    location = location,
                    description = desc,
                    metaData = {
                        postal = postal,
                    }
                },
            }
        }
        
            -- Send POST request with JSON encoded body (payload)
            PerformHttpRequest("https://api.sonorancad.com/emergency/new_dispatch", function(statusCode, res, headers)
                if statusCode == 200 and res ~= nil then
                    -- Status code 200 (Success)
                    --print("result: "..tostring(res))
                else
                    -- Error code
                    print(("CAD API ERROR: %s %s"):format(statusCode, res))
                end
            end, "POST", json.encode(payload), {["Content-Type"]="application/json"})
        end
    
    end

end) end)
