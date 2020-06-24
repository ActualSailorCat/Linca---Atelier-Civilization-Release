--=============================================
-- LINCA / AI
--=============================================
-----------------------------------------------	
-- AiListTypes
-----------------------------------------------	
INSERT INTO AiListTypes	
		(ListType)
VALUES	('SAILOR_LINCA_Civics'),
		('SAILOR_LINCA_Techs'),
		('SAILOR_LINCA_Buildings'),
		('SAILOR_LINCA_Districts'),
		('SAILOR_LINCA_Improvements'),
		('SAILOR_LINCA_PseudoYields'),
		('SAILOR_LINCA_Yields'),
		('SAILOR_LINCA_Units'),
		('SAILOR_LINCA_Settle'),
		('SAILOR_LINCA_Alliances'),
		('SAILOR_LINCA_Diploaction'),
		('SAILOR_LINCA_Discussions'),
		('SAILOR_LINCA_PlotEvaluation');

-----------------------------------------------	
-- AiLists
-----------------------------------------------	
INSERT INTO AiLists	
		(ListType,							AgendaType,							System)
VALUES	('SAILOR_LINCA_Civics',				'TRAIT_AGENDA_SAILOR_LINCA',		'Civics'),
		('SAILOR_LINCA_Techs',				'TRAIT_AGENDA_SAILOR_LINCA',		'Technologies'),
		('SAILOR_LINCA_Buildings',			'TRAIT_AGENDA_SAILOR_LINCA',		'Buildings'),
		('SAILOR_LINCA_Districts',			'TRAIT_AGENDA_SAILOR_LINCA',		'Districts'),
		('SAILOR_LINCA_Improvements',		'TRAIT_AGENDA_SAILOR_LINCA',		'Improvements'),
		('SAILOR_LINCA_PseudoYields',		'TRAIT_AGENDA_SAILOR_LINCA',		'PseudoYields'),
		('SAILOR_LINCA_Yields',				'TRAIT_AGENDA_SAILOR_LINCA',		'Yields'),
		('SAILOR_LINCA_Units',				'TRAIT_AGENDA_SAILOR_LINCA',		'Units'),
		('SAILOR_LINCA_Settle',				'TRAIT_AGENDA_SAILOR_LINCA',		'Settle'),
		('SAILOR_LINCA_Alliances',			'TRAIT_AGENDA_SAILOR_LINCA',		'Alliances'),
		('SAILOR_LINCA_Diploaction',		'TRAIT_AGENDA_SAILOR_LINCA',		'DiplomaticActions'),
		('SAILOR_LINCA_Discussions',		'TRAIT_AGENDA_SAILOR_LINCA',		'Discussions'),
		('SAILOR_LINCA_PlotEvaluation',		'TRAIT_AGENDA_SAILOR_LINCA',		'PlotEvaluation');

-----------------------------------------------	
-- AiFavoredItems
-----------------------------------------------
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item,							Value)
VALUES	
-- YIELDS
		('SAILOR_LINCA_Yields',			1,			'YIELD_FOOD',						50),		
-- PSEUDOYIELDS
		('SAILOR_LINCA_PseudoYields',	1,			'PSEUDOYIELD_CLEAR_BANDIT_CAMPS',	10),
-- UNITS
		('SAILOR_LINCA_Units',			1,			'UNIT_SAILOR_ATLEER_UU',			10),
		('SAILOR_LINCA_Units',			1,			'UNIT_SAILOR_LINCA_UU',				20),
-- BUILDINGS & DISTRICTS
		('SAILOR_LINCA_Buildings',		1,			'BUILDING_BARRACKS',				0),
		('SAILOR_LINCA_Districts',		1,			'DISTRICT_SAILOR_LINCA_UD',			20),				
		('SAILOR_LINCA_Districts',		1,			'DISTRICT_ENCAMPMENT',				0),	
-- IMPROVEMENTS
		('SAILOR_LINCA_Improvements',	1,			'IMPROVEMENT_SAILOR_ATLEER_UI',		50),
		('SAILOR_LINCA_Improvements',	1,			'IMPROVEMENT_CAMP',					50),
-- WONDERS
		('SAILOR_LINCA_Buildings',		1,			'BUILDING_HANGING_GARDENS',			0),
		('SAILOR_LINCA_Buildings',		1,			'BUILDING_PETRA',					0),
		('SAILOR_LINCA_Buildings',		1,			'BUILDING_PYRAMIDS',				0),
		('SAILOR_LINCA_Buildings',		1,			'BUILDING_KILWA_KISIWANI',			0),
-- CIVICS & TECHS
		('SAILOR_LINCA_Civics',			1,			'CIVIC_CRAFTSMANSHIP',				0), 
		('SAILOR_LINCA_Civics',			1,			'CIVIC_FEUDALISM',					0), 
		('SAILOR_LINCA_Civics',			1,			'CIVIC_MERCANTILISM',				0), 
		('SAILOR_LINCA_Techs',			1,			'TECH_ANIMAL_HUSBANDRY',			0), 
		('SAILOR_LINCA_Techs',			1,			'TECH_SYNTHETIC_MATERIALS',			0), 
		('SAILOR_LINCA_Techs',			1,			'TECH_BRONZE_WORKING',				0),
-- SETTLE
		('SAILOR_LINCA_Settle',			1,			'Foreign Continent',				20),
-- ALLIANCES
		('SAILOR_LINCA_Alliances',		1,			'ALLIANCE_MILITARY',				0),
-- DIPLOACTION
		('SAILOR_LINCA_Diploaction',	1,			'DIPLOACTION_ALLIANCE_MILITARY',		0),
		('SAILOR_LINCA_Diploaction',	1,			'DIPLOACTION_DECLARE_LIBERATION_WAR',	0),
		('SAILOR_LINCA_Diploaction',	1,			'DIPLOACTION_DECLARE_PROTECTORATE_WAR',	0),
-- DISCUSSIONS
		('SAILOR_LINCA_Discussions',	1,			'WC_EMERGENCY_MILITARY',			0);

INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item,				Value)
SELECT	'SAILOR_LINCA_Buildings',		1,			BuildingType,		0
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_GOVERNMENT';

INSERT INTO AiFavoredItems
		(ListType,						Favored,	Item,				Value)
SELECT	'SAILOR_LINCA_Civics',			1,			CivicType,			0
FROM CivicModifiers WHERE ModifierId = 'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS';

-- PLOT EVALUATION
INSERT INTO AiFavoredItems
		(ListType,						Item,				Favored,	StringVal,			Value)
VALUES  ('SAILOR_LINCA_PlotEvaluation',	'Specific Terrain',	1,			'TERRAIN_DESERT',	0);	