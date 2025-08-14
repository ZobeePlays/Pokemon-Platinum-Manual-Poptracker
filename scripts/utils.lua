function has(item, amount)
	local count = Tracker:ProviderCountForCode(item)
	amount = tonumber(amount)
	if not amount then
		return count > 0
	else
		return count >= amount
	end
end

function toggle_item(code)
    local active = Tracker:FindObjectForCode(code).Active
    code = code
    local object = Tracker:FindObjectForCode(code)
    if object then
        object.Active = active
    else
        if ENABLE_DEBUG_LOG then
            print(string.format("toggle_item: could not find object for code %s", code))
        end
    end
end

function has_value (t, val)
    for i, v in ipairs(t) do
        if v == val then return 1 end
    end
    return 0
end

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end

function toggle_hosted_item(code)
    local active = Tracker:FindObjectForCode(code).Active
    code = code:gsub("")
    local object = Tracker:FindObjectForCode(code)
    if object then
        object.Active = active
    else
        if ENABLE_DEBUG_LOG then
            print(string.format("toggle_hosted_item: could not find object for code %s", code))
        end
    end
end

function containsItem(list, item)
    if list and item then
        for _, value in pairs(list) do
            if value == item then
                return true
            end
        end
    end
    
    return false
end

function tabswitch(unsanitized)
    if string.sub(unsanitized, 1, 6) == "tabto_" then
        local mapgroup, submap = unsanitized:match("tabto_(.-)_and_(.+)")
        Tracker:UiHint("ActivateTab", mapgroup)
        Tracker:UiHint("ActivateTab", submap)
        Tracker:FindObjectForCode(unsanitized).Active = false
    end
end

function toggle_itemgrid()
    local berry = has("opt_berry_shop_on")
    local plate = has("opt_victory_arceus")
    
    --if IS_VERTICAL then
        if berry and plate then
            Tracker:AddLayouts("layouts/tracker.json")
        elseif berry then
            Tracker:AddLayouts("layouts/tracker_berries.json")
        elseif plate then
            Tracker:AddLayouts("layouts/tracker_plates.json")
        else
            Tracker:AddLayouts("layouts/tracker_none.json")
        end
    --elseif IS_HORIZONTAL then
    --
    --else
    --    print("Something went terribly wrong here.")
    --end 
    
end