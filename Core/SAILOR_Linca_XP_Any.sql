--=============================================
-- LINCA / Rise & Fall and Gathering Storm
--=============================================
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_SAILOR_LINCA_UA_XP_DESCRIPTION' WHERE TraitType = 'TRAIT_LEADER_SAILOR_LINCA_UA';

-----------------------------------------------
-- MomentIllustrations
-----------------------------------------------
INSERT INTO MomentIllustrations
		(MomentIllustrationType,					MomentDataType,				GameDataType,					Texture)
VALUES	('MOMENT_ILLUSTRATION_UNIQUE_UNIT',			'MOMENT_DATA_UNIT',			'UNIT_SAILOR_LINCA_UU',			'Moment_UniqueUnit_SAILOR_LINCA_UU.dds');

-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types 
		(Type,										Kind)
VALUES	('DYNMOD_SAILOR_LINCA_HARVESTS',			'KIND_MODIFIER');

-----------------------------------------------			
-- TraitModifiers		
-----------------------------------------------	
INSERT INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_LEADER_SAILOR_LINCA_UA',	'SAILOR_LINCA_UA_CHONGUS_FOOD');

-----------------------------------------------	
-- DynamicModifiers
-----------------------------------------------	
INSERT INTO DynamicModifiers
		(ModifierType,						CollectionType,						EffectType)
VALUES	('DYNMOD_SAILOR_LINCA_HARVESTS',	'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_RESOURCE_HARVEST_BONUS');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,							ModifierType,										RunOnce,	Permanent,	OwnerRequirementSetId,		SubjectStackLimit,	SubjectRequirementSetId)
VALUES	('SAILOR_LINCA_UA_CHONGUS_FOOD',		'DYNMOD_SAILOR_LINCA_HARVESTS',						0,			0,			NULL,						NULL,				NULL);

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,			Value)
VALUES	('SAILOR_LINCA_UA_CHONGUS_FOOD',		'Amount',		25);