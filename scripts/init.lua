-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

ScriptHost:LoadScript("scripts/utils.lua")
ScriptHost:LoadScript("scripts/watch.lua")
ScriptHost:LoadScript("scripts/logic/logic.lua")


-- Custom Items
-- ScriptHost:LoadScript("scripts/custom_items/class.lua")
-- ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
-- ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/settings.json")


if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.json")    
    -- Locations
    Tracker:AddLocations("locations/Sinnoh.json")
    Tracker:AddLocations("locations/Cities.json")
    Tracker:AddLocations("locations/Routes.json")
    Tracker:AddLocations("locations/Dungeons.json")
    Tracker:AddLocations("locations/Mt Coronet.json")
end

-- Layout
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/tabs.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end

initialize_watch_items()
