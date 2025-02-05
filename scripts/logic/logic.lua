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

function hidden_on()
	return has("opt_hidden_on")
end

function defogcross()
	return defog() or has("opt_defog_cross_on")
end

function defogitems()
	return defog() or (has("opt_defog_cross_on") and has("opt_defog_items_on"))
end

function battlezoneon()
	return has("opt_bz_on")
end

--Victorys

function champ()
  return badges(8)
 end

function vict_arceus()
	return has("azureflute") and plates(16)
end

-- Beeg Access
function floaroma()
	return rocksmash() or has("Bicycle")
end

function canalave()
	return surf()
	and (
		fly()
		or has("opt_fly_early_off")
	)
end
function eterna()
	return (
		has("Bicycle")
		or (
			rocksmash()
			and r205river()
		)
	)
	and (
		fly()
		or has("opt_fly_early_off")
	)
end

function central()
	return (
		has("Bicycle")
		or (
			rocksmash()
			and r205river()
			and strength()
			and defogcross()
			and has("SecretPotion")
		)
	)
	and (
		fly()
		or has("opt_fly_early_off")
	)
end

function uppercoronet()
	return central()
	and surf()
	and rockclimb()
	and strength()
	and has("event_guardians")
end

function celestic()
	return (
		eterna()
		and (
			strength()
			and rocksmash()
		)
	or (
		has("Bicycle")
		and has("SecretPotion")
		and defogcross()
	)
	or uppercoronet())
end

function north()
	return celestic()
	and strength()
	and (
		fly()
		or has("opt_fly_north_off")
	)
	and defogcross()
end

function battlezone()
	return north()
	and has("S.S.Ticket")
	and has("ProgDex3")
end

function pastoria()
	return central()
	and (
		surf()
		or has("opt_extra_blocks_off")
	)
end

function sunnyshore()
	return pastoria()
	and (
		has("event_distortion")
		or has("opt_open_sshore_on")
	)
end

function vroad()
	return sunnyshore()
	and surf()
	and waterfall()
end

function vroadback()
	return vroad()
	and rocksmash()
	and rockclimb()
	and strength()
end

function vrbonus()
	return vroadback()
	and defogcross()
end

function blue()
    return AccessibilityLevel.Inspect
end