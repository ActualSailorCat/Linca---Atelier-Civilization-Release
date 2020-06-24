--=============================================
-- Linca Gov't Spawner by SailorCat
--=============================================
function Sailor_Linca_Spawner_Vanilla (playerID, governmentID)
	if lincaRFActive or lincaGSActive then return end
	local bLINCALeader = false
	local pPlayerConfig = PlayerConfigurations[playerID]
	local sLeader = pPlayerConfig:GetLeaderTypeName()
	if sLeader == 'LEADER_SAILOR_LINCA' then
		bLINCALeader = true
	end
	if bLINCALeader == true then
	local chongusUnit = GameInfo.Units["UNIT_SAILOR_LINCA_UU"].UnitType
		print("Is chungus.")
			--local lincaChiefdom = GameInfo.Governments[governmentID].GovernmentType
			--print(lincaChiefdom)
			iValidGovtCheck = Game:GetProperty("SailorLincaGovt_" .. governmentID)
			if iValidGovtCheck ~= 1 then
				Game:SetProperty("SailorLincaGovt_" .. governmentID, 1)
				local pPlayer = Players[playerID]
				local pPlayerCities = pPlayer:GetCities()
				local pCap = pPlayerCities:GetCapitalCity()
				UnitManager.InitUnit(playerID, chongusUnit, pCap:GetX(), pCap:GetY())
			end
	else
		print("Expacs active.")
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
	Events.GovernmentChanged.Add(Sailor_Linca_Spawner_Vanilla)
else
    print ("///// Linca not detected.")
end