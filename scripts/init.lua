ENABLE_DEBUG_LOG = true
local variant = Tracker.ActiveVariantUID
IS_VERTICAL = variant:find("Map Tracker")
IS_HORIZONTAL = variant:find("tracker_horizontal")

ScriptHost:LoadScript("scripts/utils.lua")
ScriptHost:LoadScript("scripts/watch.lua")
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/settings.json")
Tracker:AddItems("items/map_tab_items.json")

-- Maps
Tracker:AddMaps("maps/maps.json")
  
-- Locations
Tracker:AddLocations("locations/Sinnoh.json")
Tracker:AddLocations("locations/Cities.json")
Tracker:AddLocations("locations/Routes.json")
Tracker:AddLocations("locations/Dungeons.json")
Tracker:AddLocations("locations/Mt Coronet.json")
Tracker:AddLocations("locations/tabswitch_locations.json")

-- Layout
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/settings_popout.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/tabs.json")

-- Autotracking
ScriptHost:LoadScript("scripts/autotracking.lua")

initialize_watch_items()