--[[
    Sonoran Plugins

    Plugin Configuration

    Put all needed configuration in this file.

]]
local config = {
    enabled = true,
    configVersion = "1.0",
    pluginName = "auto-dipatch", -- name your plugin here
    pluginAuthor = "KastenMonster", -- author

    -- put your configuration options below
    communityid = "PKERPKX",
    apikey = "9DEDC81-45F5-4EB2-94"
}

if config.enabled then
    Config.RegisterPluginConfig(config.pluginName, config)
end