HOSTED_ITEMS = {
"event_rowan", "event_oreburgh", "event_veilstone", "event_pastoria",
"event_canalave", "event_saturn", "event_mars", "event_jupiter",
"event_galactichq", "event_guardians", "event_distortion", "event_palpark",
"event_cynthia", "event_bombs", "event_arceus", "event_warehouse"

}

function initialize_watch_items()
    for _, code in pairs(HOSTED_ITEMS) do
        ScriptHost:AddWatchForCode(code, code, toggle_item)
    end
end
