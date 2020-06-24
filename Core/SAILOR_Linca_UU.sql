--=============================================
-- LINCA / UU
--=============================================
-----------------------------------------------	
-- Tags
-----------------------------------------------	
INSERT INTO Tags
		(Tag,									Vocabulary)
VALUES	('CLASS_SAILOR_LINCA_UU',				'ABILITY_CLASS');

-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types
		(Type,									Kind)
VALUES	('UNIT_SAILOR_LINCA_UU',				'KIND_UNIT'),
		('ABILITY_SAILOR_LINCA_UU_ESCORTING',	'KIND_ABILITY'),
		('ABILITY_SAILOR_LINCA_UU_NAVAL',		'KIND_ABILITY');

-----------------------------------------------	
-- TypeTags
-----------------------------------------------	
INSERT INTO TypeTags
		(Type,									Tag)
VALUES	('UNIT_SAILOR_LINCA_UU',				'CLASS_SAILOR_LINCA_UU'),
		('ABILITY_SAILOR_LINCA_UU_ESCORTING',	'CLASS_SAILOR_LINCA_UU');

INSERT INTO TypeTags
		(Type,								Tag)
SELECT	'UNIT_SAILOR_LINCA_UU',				Tag
FROM TypeTags WHERE Type = 'UNIT_SWORDSMAN';

INSERT INTO TypeTags
				(Type,								Tag)
SELECT DISTINCT	'ABILITY_SAILOR_LINCA_UU_NAVAL',	Tag
FROM TypeTags WHERE Tag LIKE 'CLASS_NAVAL%';

-----------------------------------------------
-- Units
-----------------------------------------------
INSERT INTO Units	(
		UnitType,
		Name,
		Description,
		TraitType,
		BaseMoves,
		Cost,
		StrategicResource,
		PurchaseYield,
		AdvisorType,
		Combat,
		BaseSightRange,
		ZoneOfControl,
		Domain,
		FormationClass,
		PromotionClass,
		PrereqTech,
		Maintenance
		)
SELECT	'UNIT_SAILOR_LINCA_UU', -- UnitType
		'LOC_UNIT_SAILOR_LINCA_UU_NAME', -- Name
		'LOC_UNIT_SAILOR_LINCA_UU_DESCRIPTION', -- Description
		'TRAIT_LEADER_UNIT_SAILOR_LINCA_UU', -- TraitType
		BaseMoves,
		Cost,
		StrategicResource,
		PurchaseYield,
		AdvisorType,
		Combat,
		BaseSightRange,
		ZoneOfControl,
		Domain,
		FormationClass,
		PromotionClass,
		PrereqTech,
		Maintenance
FROM	Units
WHERE	UnitType = 'UNIT_ROMAN_LEGION';

-----------------------------------------------
-- UnitReplaces
-----------------------------------------------
INSERT INTO UnitReplaces
		(CivUniqueUnitType,			ReplacesUnitType)
VALUES	('UNIT_SAILOR_LINCA_UU',	'UNIT_SWORDSMAN');

-----------------------------------------------
-- UnitUpgrades
-----------------------------------------------
INSERT INTO UnitUpgrades
		(Unit,						UpgradeUnit)
SELECT 	'UNIT_SAILOR_LINCA_UU',		UpgradeUnit
FROM UnitUpgrades WHERE Unit = 'UNIT_SWORDSMAN';

-----------------------------------------------
-- UnitAiInfos
-----------------------------------------------
INSERT INTO UnitAiInfos
		(UnitType,					AiType)
SELECT	'UNIT_SAILOR_LINCA_UU',		AiType
FROM UnitAiInfos WHERE UnitType = 'UNIT_SWORDSMAN';

-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT INTO UnitAbilities
		(UnitAbilityType,						Name,											Description,											Inactive)
VALUES	('ABILITY_SAILOR_LINCA_UU_ESCORTING',	'LOC_ABILITY_SAILOR_LINCA_UU_ESCORTING_NAME',	'LOC_ABILITY_SAILOR_LINCA_UU_ESCORTING_DESCRIPTION',	0),
		('ABILITY_SAILOR_LINCA_UU_NAVAL',		'LOC_ABILITY_SAILOR_LINCA_UU_NAVAL_NAME',		'LOC_ABILITY_SAILOR_LINCA_UU_NAVAL_DESCRIPTION',		1);

-----------------------------------------------
--  UnitAbilityModifiers
-----------------------------------------------
INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,						ModifierId)
VALUES	('ABILITY_SAILOR_LINCA_UU_ESCORTING',	'ABILITY_SAILOR_LINCA_UU_ESCORTING_MOD'),	-- +5 when sharing tile with civvie
		('ABILITY_SAILOR_LINCA_UU_NAVAL',		'ABILITY_SAILOR_LINCA_UU_NAVAL_MOD');		-- +5 to naval units sharing tile

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO	Modifiers
		(ModifierId,								ModifierType,								Permanent,	SubjectRequirementSetId)
VALUES	('ABILITY_SAILOR_LINCA_UU_ESCORTING_MOD',	'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		0,			'CONVOY_REQUIREMENTS'),
		('ABILITY_SAILOR_LINCA_UU_NAVAL_MOD',		'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		0,			'SAILOR_LINCA_TILE_REQUIREMENT');

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO	ModifierArguments
		(ModifierId,								Name,		Value)
VALUES	('ABILITY_SAILOR_LINCA_UU_ESCORTING_MOD',	'Amount',	4),
		('ABILITY_SAILOR_LINCA_UU_NAVAL_MOD',		'Amount',	4);

-----------------------------------------------
-- ModifierStrings
-----------------------------------------------
INSERT INTO ModifierStrings
		(ModifierId,								Context,	Text)
VALUES	('ABILITY_SAILOR_LINCA_UU_ESCORTING_MOD',	'Preview',	'LOC_ABILITY_SAILOR_LINCA_UU_ESCORTING_MOD_PREVIEW_TEXT'),
		('ABILITY_SAILOR_LINCA_UU_NAVAL_MOD',		'Preview',	'LOC_ABILITY_SAILOR_LINCA_UU_NAVAL_MOD_PREVIEW_TEXT');

-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
VALUES	('SAILOR_LINCA_TILE_REQUIREMENT',			'REQUIREMENTSET_TEST_ALL');

-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
VALUES  ('SAILOR_LINCA_TILE_REQUIREMENT',			'SAILOR_REQUIRES_PLOT_IS_LINCA');

-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,								RequirementType)
VALUES	('SAILOR_REQUIRES_PLOT_IS_LINCA',			'REQUIREMENT_PLOT_UNIT_TYPE_MATCHES');

-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments 
		(RequirementId,								Name,			Value) 
VALUES	('SAILOR_REQUIRES_PLOT_IS_LINCA',			'UnitType',		'UNIT_SAILOR_LINCA_UU');