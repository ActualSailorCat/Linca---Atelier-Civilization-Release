--=============================================
-- LINCA / Gathering Storm
--=============================================
-----------------------------------------------			
-- Units_XP2
-----------------------------------------------	
INSERT INTO Units_XP2
		(UnitType, ResourceMaintenanceAmount, ResourceCost, ResourceMaintenanceType, TourismBomb, CanEarnExperience, TourismBombPossible, CanFormMilitaryFormation, MajorCivOnly)
SELECT 'UNIT_SAILOR_LINCA_UU', ResourceMaintenanceAmount, ResourceCost / 2, ResourceMaintenanceType, TourismBomb, CanEarnExperience, TourismBombPossible, CanFormMilitaryFormation, MajorCivOnly
FROM Units_XP2 WHERE UnitType = 'UNIT_SWORDSMAN';