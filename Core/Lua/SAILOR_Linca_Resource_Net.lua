local tLincaChongusResources = {}
for i, tRow in ipairs(DB.Query("SELECT ResourceType FROM Sailor_Linca_Edibles")) do
tLincaChongusResources[i] = tRow
end
--=============================================
-- Resource Tracker by SeelingCat & SailorCat
--=============================================
function Sailor_Linca_Resource_Tracker(iX, iY, resourceType)
	for i, iChongusRes in ipairs(tLincaChongusResources) do
		plotRes = GameInfo.Resources[resourceType].ResourceType
		if plotRes == iChongusRes.ResourceType then
			Game:SetProperty("SailorLincaResource_" .. iX .. "_" .. iY, 1)
		end
	end
end
Events.ResourceAddedToMap.Add(Sailor_Linca_Resource_Tracker)