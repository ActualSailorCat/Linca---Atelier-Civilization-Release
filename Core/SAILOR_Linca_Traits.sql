--=============================================
-- LINCA / Traits
--=============================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types 
		(Type,										Kind)
VALUES	('TRAIT_LEADER_SAILOR_LINCA_UA',			'KIND_TRAIT'),
		('TRAIT_LEADER_UNIT_SAILOR_LINCA_UU',		'KIND_TRAIT'),
		('DYNMOD_SAILOR_LINCA_YUMMYSAND',			'KIND_MODIFIER');

-----------------------------------------------
-- Traits
-----------------------------------------------
INSERT INTO Traits
		(TraitType,									Name,												Description)
VALUES	('TRAIT_LEADER_SAILOR_LINCA_UA',			'LOC_TRAIT_LEADER_SAILOR_LINCA_UA_NAME',			'LOC_TRAIT_LEADER_SAILOR_LINCA_UA_DESCRIPTION'),
		('TRAIT_LEADER_UNIT_SAILOR_LINCA_UU',		'LOC_TRAIT_LEADER_UNIT_SAILOR_LINCA_UU_NAME',		'LOC_TRAIT_LEADER_UNIT_SAILOR_LINCA_UU_DESCRIPTION');

-----------------------------------------------
-- LeaderTraits
-----------------------------------------------	
INSERT INTO LeaderTraits	
		(LeaderType,						TraitType)
VALUES	('LEADER_SAILOR_LINCA',				'TRAIT_LEADER_SAILOR_LINCA_UA'),
		('LEADER_SAILOR_LINCA',				'TRAIT_LEADER_UNIT_SAILOR_LINCA_UU');

-----------------------------------------------			
-- TraitModifiers		
-----------------------------------------------	
INSERT INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_LEADER_SAILOR_LINCA_UA',	'SAILOR_LINCA_UA_NAVAL_SUPPORT');

-----------------------------------------------			
-- BuildingModifiers		
-----------------------------------------------	
-- Vanilla
INSERT INTO BuildingModifiers
		(BuildingType,			ModifierId)
SELECT	'BUILDING_GRANARY',		'SAILOR_LINCA_UA_HONGRY'
WHERE NOT EXISTS (SELECT 1 FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');

-----------------------------------------------			
-- Resource Gathering
-----------------------------------------------	
CREATE TABLE IF NOT EXISTS Sailor_Linca_Edibles (ResourceType text default NULL);
INSERT INTO Sailor_Linca_Edibles (ResourceType) SELECT ResourceType FROM Resources
WHERE ResourceType IN ('RESOURCE_BANANAS', 'RESOURCE_CATTLE', 'RESOURCE_CRABS', 'RESOURCE_DEER', 'RESOURCE_FISH', 'RESOURCE_RICE', 'RESOURCE_SHEEP', 'RESOURCE_WHEAT');

-- DLC
INSERT INTO Sailor_Linca_Edibles (ResourceType) SELECT ResourceType FROM Resources WHERE ResourceType = 'RESOURCE_MAIZE' AND EXISTS (SELECT ResourceType FROM Resources WHERE ResourceType = 'RESOURCE_MAIZE');

-- Sukritact's
INSERT INTO Sailor_Linca_Edibles (ResourceType) SELECT ResourceType FROM Resources WHERE ResourceType IN ('RESOURCE_SUK_CAMEL', 'RESOURCE_DLV_BISON')
AND EXISTS (SELECT ResourceType FROM Resources WHERE ResourceType = 'RESOURCE_SUK_CAMEL');

-- Reindeer
INSERT INTO Sailor_Linca_Edibles (ResourceType) SELECT ResourceType FROM Resources WHERE ResourceType = 'RESOURCE_AOM_REINDEER'
AND EXISTS (SELECT ResourceType FROM Resources WHERE ResourceType = 'RESOURCE_AOM_REINDEER');

-- Resourceful 2
INSERT INTO Sailor_Linca_Edibles (ResourceType) SELECT ResourceType FROM Resources WHERE ResourceType IN ('RESOURCE_ALOE', 'RESOURCE_BERRIES', 'RESOURCE_SALMON', 'RESOURCE_ALGAE', 'RESOURCE_OXEN', 'RESOURCE_HAM', 'RESOURCE_COD', 'RESOURCE_MACKEREL', 'RESOURCE_MUSSELS', 'RESOURCE_MUSHROOMS', 'RESOURCE_DATES', 'RESOURCE_TOMATO', 'RESOURCE_BARLEY', 'RESOURCE_POTATO', 'RESOURCE_SORGHUM')
AND EXISTS (SELECT ResourceType FROM Resources WHERE ResourceType = 'RESOURCE_ALOE');

-----------------------------------------------	
-- DynamicModifiers
-----------------------------------------------	
INSERT INTO DynamicModifiers
		(ModifierType,						CollectionType,						EffectType)
VALUES	('DYNMOD_SAILOR_LINCA_YUMMYSAND',	'COLLECTION_OWNER_CITY',			'EFFECT_ADJUST_POLICY_AMENITY');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,							ModifierType,										RunOnce,	Permanent,	OwnerRequirementSetId,		SubjectStackLimit,	SubjectRequirementSetId)
VALUES	('SAILOR_LINCA_UA_NAVAL_SUPPORT',		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',				0,			1,			NULL,						NULL,				NULL);

-- Vanilla
INSERT INTO Modifiers
		(ModifierId,							ModifierType,										OwnerRequirementSetId)
SELECT	'SAILOR_LINCA_UA_HONGRY',				'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY',			'SAILOR_LINCA_UA_IRONWORKING_REQUIREMENT'
WHERE NOT EXISTS (SELECT EffectType FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');

-- Lua Modifiers
INSERT INTO Modifiers
		(ModifierId,							ModifierType,						Permanent)
VALUES	('SAILOR_LINCA_CITY_AMENITY_MODIFIER',	'DYNMOD_SAILOR_LINCA_YUMMYSAND',	1);

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,			Value)
VALUES	('SAILOR_LINCA_UA_NAVAL_SUPPORT',		'AbilityType',	'ABILITY_SAILOR_LINCA_UU_NAVAL'),
		('SAILOR_LINCA_CITY_AMENITY_MODIFIER',	'Amount',		1);

-- Vanilla
INSERT INTO ModifierArguments
		(ModifierId,							Name,			Value)
SELECT	'SAILOR_LINCA_UA_HONGRY',				'UnitType',		'UNIT_SAILOR_LINCA_UU'
WHERE NOT EXISTS (SELECT EffectType FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');

INSERT INTO ModifierArguments
		(ModifierId,							Name,			Value)
SELECT	'SAILOR_LINCA_UA_HONGRY',				'Amount',		1
WHERE NOT EXISTS (SELECT EffectType FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');

-- All Vanilla Below
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
SELECT	'SAILOR_LINCA_UA_IRONWORKING_REQUIREMENT',	'REQUIREMENTSET_TEST_ALL'
WHERE NOT EXISTS (SELECT 1 FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');

-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
SELECT	'SAILOR_LINCA_UA_IRONWORKING_REQUIREMENT',		'SAILOR_REQUIRES_LINCA'
WHERE NOT EXISTS (SELECT 1 FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
SELECT	'SAILOR_LINCA_UA_IRONWORKING_REQUIREMENT',		'SAILOR_REQUIRES_LINCA_IRONWORKING'
WHERE NOT EXISTS (SELECT 1 FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');

-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,						RequirementType)
SELECT	'SAILOR_REQUIRES_LINCA',			'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES'
WHERE NOT EXISTS (SELECT 1 FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');

INSERT INTO Requirements
		(RequirementId,							RequirementType)
SELECT	'SAILOR_REQUIRES_LINCA_IRONWORKING',	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY'
WHERE NOT EXISTS (SELECT 1 FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');

-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments 
		(RequirementId,						Name,				Value) 
SELECT	'SAILOR_REQUIRES_LINCA',			'LeaderType',		'LEADER_SAILOR_LINCA'
WHERE NOT EXISTS (SELECT 1 FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');

INSERT INTO RequirementArguments 
		(RequirementId,							Name,				Value) 
SELECT	'SAILOR_REQUIRES_LINCA_IRONWORKING',	'TechnologyType',	'TECH_IRON_WORKING'
WHERE NOT EXISTS (SELECT 1 FROM DynamicModifiers WHERE EffectType = 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL');