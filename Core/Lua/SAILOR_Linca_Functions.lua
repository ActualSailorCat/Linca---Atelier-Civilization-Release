--=============================================
-- Chungus Linca by SailorCat
--=============================================
function Sailor_Linca_Chungus (iX, iY, resourceType)
	print(resourceType)
	local bLINCALeader = false
	local pPlot = Map.GetPlot(iX,iY)
	local pWned = pPlot:GetOwner()
	if pWned ~= -1 then
		local pPlayerConfig = PlayerConfigurations[pWned]
		local sLeader = pPlayerConfig:GetLeaderTypeName()
		if sLeader == 'LEADER_SAILOR_LINCA' then
			bLINCALeader = true
		end
	end

	if bLINCALeader == true then
		print("CHONGUS ACTIVATED")
		local pPlayer = Players[pWned]
		local pPlotIndex = pPlot:GetIndex()
		local pCity = Cities.GetPlotPurchaseCity(pPlotIndex)
		if pCity then
			iValidResCheck = Game:GetProperty("SailorLincaResource_" .. pPlot:GetX() .. "_" .. pPlot:GetY())
			if iValidResCheck == 1 then
				Game:SetProperty("SailorLincaResource_" .. pPlot:GetX() .. "_" .. pPlot:GetY(), 0)
				local iTurn = Game.GetCurrentGameTurn()
				iHarvestedCheck = Game:GetProperty("SailorLincaHarvested" .. pPlot:GetX() .. "_" .. pPlot:GetY())
				if iHarvestedCheck ~= iTurn then
					Game:SetProperty("SailorHarvested" .. pPlot:GetX() .. "_" .. pPlot:GetY(), iTurn)
					local pCityQueue = pCity:GetBuildQueue()
					pCity:AttachModifierByID("SAILOR_LINCA_CITY_AMENITY_MODIFIER")
					if pPlayer:IsHuman() then
						Game.AddWorldViewText(pOwner, Locale.Lookup("+1 [ICON_Amenities] Amenity"), pPlot:GetX(), pPlot:GetY(), 0)
					end
				end		
			end
		end
	end
end
--=============================================
-- Linca Governor Spawner by SailorCat
--=============================================
local chongusUnit = GameInfo.Units["UNIT_SAILOR_LINCA_UU"].UnitType
local chongusTech = GameInfo.Technologies["TECH_IRON_WORKING"].Index

function Sailor_Linca_Spawner (player, iDelta)
	local bLINCALeader = false
	local pPlayerConfig = PlayerConfigurations[player]
	local sLeader = pPlayerConfig:GetLeaderTypeName()
	if sLeader == 'LEADER_SAILOR_LINCA' then
		bLINCALeader = true
	end

	if bLINCALeader == true then
		local pPlayer = Players[player]
		local pPlayerTechs = pPlayer:GetTechs()
		if pPlayerTechs:HasTech(chongusTech) then
			local pPlayerCities = pPlayer:GetCities()
			local pCap = pPlayerCities:GetCapitalCity()
			UnitManager.InitUnit(player, chongusUnit, pCap:GetX(), pCap:GetY())
		else
			iLincaQueue = Game:GetProperty("SailorLincaQueue")
			if iLincaQueue == nil then
				iLincaQueue = 1
				Game:SetProperty("SailorLincaQueue", iLincaQueue)
			else
				iLincaQueue = iLincaQueue + 1
				Game:SetProperty("SailorLincaQueue", iLincaQueue)
			end
		end
	end
end
--=============================================
-- Linca Queue Spawner by SailorCat
--=============================================
function Sailor_Linca_Queue (player, eTech)
	local bLINCALeader = false
	local pPlayerConfig = PlayerConfigurations[player]
	local sLeader = pPlayerConfig:GetLeaderTypeName()
	if sLeader == 'LEADER_SAILOR_LINCA' then
		bLINCALeader = true
	end

	if bLINCALeader == true then
		if eTech == chongusTech then
			iLincaQueue = Game:GetProperty("SailorLincaQueue")
			if iLincaQueue > 0 then
			local pPlayer = Players[player]
			local pPlayerCities = pPlayer:GetCities()
			local pCap = pPlayerCities:GetCapitalCity()
				while iLincaQueue > 0 do
					UnitManager.InitUnit(player, chongusUnit, pCap:GetX(), pCap:GetY())
					iLincaQueue = iLincaQueue - 1
				end
			end
		end
	end
end
--=============================================
-- Leader Present Detection by SeelingCat
--=============================================
local bLINCAPresent = false

for k, v in ipairs(PlayerManager.GetWasEverAliveIDs()) do
    if bLINCAPresent == false then
        local sLeaderType = PlayerConfigurations[v]:GetLeaderTypeName()
        if sLeaderType == 'LEADER_SAILOR_LINCA' then
			bLINCAPresent = true
        end
    end
end
if bLINCAPresent == true then
    print ("///// Linca detected. Loading lua functions...")
	Events.ResourceRemovedFromMap.Add(Sailor_Linca_Chungus)
	Events.GovernorPointsChanged.Add(Sailor_Linca_Spawner)
	Events.ResearchCompleted.Add(Sailor_Linca_Queue)
else
    print ("///// Linca not detected.")
end