BADGES = {"ForestBadge", "CobbleBadge", "FenBadge", "MineBadge", "RelicBadge", "CoalBadge", "IcicleBadge", "BeaconBadge"}
PLATES = {"FistPlate", "SkyPlate", "ToxicPlate", "EarthPlate", "StonePlate", "InsectPlate", "SpookyPlate", "IronPlate", 
			"ZapPlate", "FlamePlate", "SplashPlate", "MeadowPlate", "MindPlate", "IciclePlate", "DracoPlate", "DreadPlate"}

function badges(AMOUNT)
	AMOUNT = tonumber(AMOUNT)
	local req = AMOUNT
	local count = 0
	for _, item in pairs(BADGES) do
		if has(item) then
			count = count + 1
		end
	end
	return count >= req
end

function plates(AMOUNT)
    AMOUNT = tonumber(AMOUNT)
    local req = AMOUNT
    local count = 0
    for _, item in pairs(PLATES) do
        if has(item) then
            count = count + 1
        end
    end
    return count >= req
end

-- Access Functions
-- HMs
function cut()
  return has("HM01Cut") and has("ForestBadge")
end

function fly()
  return has("HM02Fly") and has("CobbleBadge")
end

function surf()
  return has("HM03Surf") and has("FenBadge")
end

function strength()
  return has("HM04Strength") and has("MineBadge")
end

function defog()
  return has("HM05Defog") and has("RelicBadge")
end

function rocksmash()
  return has("HM06RockSmash") and has("CoalBadge")
end

function waterfall()
  return has("HM07WaterFall") and has("BeaconBadge") and surf()
end

function rockclimb()
  return has("HM08RockClimb") and has("IcicleBadge")
end

function coupon()
  return has("Coupon1") and has("Coupon2") and has("Coupon3") and has("Parcel")
 end
 
function lakehunt()
	return has("event_saturn") and has("event_mars") and has("event_jupiter")
end

function warehouseopen()
	return has("StorageKey") or has("event_galactichq")
end

function r205river()
	return has("WorksKey") or surf()
end

-- YAML Options
 
function hidden()
  return (has("opt_dowsing_off") or (has("Poketch") and has("DowsingMachineApp")))
end

function hidden_217()
  return (has("opt_217_off") or (has("Poketch") and has("DowsingMachineApp")))
end

function flash()
	return has("TM70-Flash") or (east() and has("opt_flash_on"))
end

function marsh()
	return has("MarshPass") or has("opt_marsh_off")
end

function hidden_on()
	return has("opt_hidden_on")
end

function defogcross()
    if defog() or has("opt_defog_cross_on") then
        return AccessibilityLevel.Normal
    else
        return AccessibilityLevel.SequenceBreak
    end
end

function defogitems()
    if defog() or (has("opt_defog_cross_on") and has("opt_defog_items_on")) then
        return AccessibilityLevel.Normal
    else
        return AccessibilityLevel.SequenceBreak
    end
end

function early_fly()
    if fly() or has("opt_fly_early_off") then
        return AccessibilityLevel.Normal
    else
        return AccessibilityLevel.SequenceBreak
    end
end

function north_fly()
    if (fly() or has("opt_fly_north_off")) and (defog() or has("opt_defog_cross_on")) then
        return AccessibilityLevel.Normal
    else
        return AccessibilityLevel.SequenceBreak
    end
end

function battlezoneon()
	return has("opt_bz_on")
end

--Victorys

function champ()
  return badges(8)
 end

function vict_arceus()
	return has("azureflute") and plates(16) and has("ProgDex3")
end

-- Beeg Access
function floaroma()
	return rocksmash() or eterna()
end

function canalave()
	return surf()
	and early_fly()
end

function eterna()
	return (
		has("Bicycle")
		or (
			rocksmash()
			and r205river()
		)
	)
	and early_fly()
end

function central()
	if (rocksmash()
			and r205river()
			and strength()
			and has("SecretPotion"))then
		if defogcross() == AccessibilityLevel.SequenceBreak or early_fly() == AccessibilityLevel.SequenceBreak then
			return AccessibilityLevel.SequenceBreak
		else
			return 
				rocksmash()
				and r205river()
				and strength()
				and has("SecretPotion")
		end
	else
		return (has("Bicycle") and early_fly())
	end
end

function uppercoronet()
	return surf()
	and rockclimb()
	and strength()
	and has("event_guardians")
	and central()
end

function celestic()
	return ((
			strength()
			and rocksmash()
		) and eterna()
	or celesticviacentral()
	or uppercoronet())
end

function celesticviacentral()
	if has("SecretPotion") then
		if central() == AccessibilityLevel.SequenceBreak then
			return AccessibilityLevel.SequenceBreak
		else
			return central() and defogcross()
		end
	else
		return has("SecretPotion")
	end
end

function north()
	if strength() then
		if celestic() == AccessibilityLevel.SequenceBreak then
			return AccessibilityLevel.SequenceBreak
		else
			return celestic() and north_fly()
		end
	else
		return strength()
	end
end

function battlezone()
	return has("S.S.Ticket")
	and has("ProgDex3")
	and north()
end

function pastoria()
	return (
		surf()
		or has("opt_extra_blocks_off")
	) and central()
end

function sunnyshore()
	return (
		has("event_distortion")
		or has("opt_open_sshore_on")
	) and pastoria()
end

function vroad()
	return surf()
	and waterfall()
	and sunnyshore()
end

function vroadback()
	return rocksmash()
	and rockclimb()
	and strength()
	and vroad()
end

function vrbonus()
	if (defogcross() == AccessibilityLevel.SequenceBreak and vroadback()) or vroadback() == AccessibilityLevel.SequenceBreak then
		return AccessibilityLevel.SequenceBreak
	else
		return defogcross()
		and vroadback()
	end
end
