--=============================================
-- LINCA / Defines
--=============================================
-----------------------------------------------
-- Types
-----------------------------------------------	
INSERT INTO Types	
		(Type,					Kind)
VALUES	('LEADER_SAILOR_LINCA',	'KIND_LEADER');

-----------------------------------------------	
-- Leaders
-----------------------------------------------	
INSERT INTO Leaders	
		(LeaderType,			Name,							Sex,		InheritFrom,		SceneLayers)
VALUES	('LEADER_SAILOR_LINCA',	'LOC_LEADER_SAILOR_LINCA_NAME',	'Female',	'LEADER_DEFAULT',	4);	

-----------------------------------------------
-- CivilizationLeaders
-----------------------------------------------	
INSERT INTO CivilizationLeaders	
		(CivilizationType,				LeaderType,					CapitalName)
VALUES	('CIVILIZATION_SAILOR_ATLEER',	'LEADER_SAILOR_LINCA',		'LOC_CITY_NAME_SAILOR_COLSEIT');

-----------------------------------------------
-- LeaderQuotes
-----------------------------------------------	
INSERT INTO LeaderQuotes	
		(LeaderType,			Quote)
VALUES	('LEADER_SAILOR_LINCA',	'LOC_PEDIA_LEADERS_PAGE_LEADER_SAILOR_LINCA_QUOTE');	

-----------------------------------------------	
-- LoadingInfo
-----------------------------------------------	
INSERT INTO LoadingInfo	
		(LeaderType,			BackgroundImage, 					ForegroundImage,				PlayDawnOfManAudio)
VALUES	('LEADER_SAILOR_LINCA',	'LEADER_SAILOR_LINCA_BACKGROUND',	'LEADER_SAILOR_LINCA_NEUTRAL',	0);	
