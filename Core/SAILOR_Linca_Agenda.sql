--=============================================
-- LINCA / Agenda
--=============================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types
		(Type,							Kind)
VALUES	('TRAIT_AGENDA_SAILOR_LINCA',	'KIND_TRAIT');

-----------------------------------------------	
-- Agendas
-----------------------------------------------	
INSERT INTO Agendas
		(AgendaType,			Name,							Description)
VALUES	('AGENDA_SAILOR_LINCA',	'LOC_AGENDA_SAILOR_LINCA_NAME',	'LOC_AGENDA_SAILOR_LINCA_DESCRIPTION');

-----------------------------------------------	
-- Traits
-----------------------------------------------	
INSERT INTO Traits
		(TraitType,						Name,					Description)
VALUES	('TRAIT_AGENDA_SAILOR_LINCA',	'LOC_PLACEHOLDER',		'LOC_PLACEHOLDER');

-----------------------------------------------	
-- AgendaTraits
-----------------------------------------------	
INSERT INTO AgendaTraits
		(AgendaType,					TraitType)
VALUES	('AGENDA_SAILOR_LINCA',			'TRAIT_AGENDA_SAILOR_LINCA');

-----------------------------------------------	
-- TraitModifiers
-----------------------------------------------	
INSERT INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_AGENDA_SAILOR_LINCA',		'AGENDA_SAILOR_LINCA_GOOD_FRIEND'),
		('TRAIT_AGENDA_SAILOR_LINCA',		'AGENDA_SAILOR_LINCA_BAD_FRIEND');

-----------------------------------------------	
-- Modifiers
-----------------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,									SubjectRequirementSetId)
VALUES	('AGENDA_SAILOR_LINCA_GOOD_FRIEND',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'PLAYER_DECLARED_FRIEND'),
		('AGENDA_SAILOR_LINCA_BAD_FRIEND',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'PLAYER_FRIEND_DENOUNCED');

-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------	
INSERT INTO ModifierArguments
		(ModifierId,						Name,							Value)
VALUES	('AGENDA_SAILOR_LINCA_GOOD_FRIEND',	'InitialValue',					12),
		('AGENDA_SAILOR_LINCA_GOOD_FRIEND',	'ReductionTurns',				10),
		('AGENDA_SAILOR_LINCA_GOOD_FRIEND',	'ReductionValue',				1),
		('AGENDA_SAILOR_LINCA_GOOD_FRIEND',	'MessageThrottle',				20),
		('AGENDA_SAILOR_LINCA_GOOD_FRIEND',	'StatementKey',					'LOC_DIPLO_KUDA_LEADER_SAILOR_LINCA_REASON_GOOD_FRIEND'),
		('AGENDA_SAILOR_LINCA_GOOD_FRIEND',	'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_SAILOR_LINCA_GOOD_FRIEND'),
		('AGENDA_SAILOR_LINCA_BAD_FRIEND',	'InitialValue',					-12),
		('AGENDA_SAILOR_LINCA_BAD_FRIEND',	'ReductionTurns',				10),
		('AGENDA_SAILOR_LINCA_BAD_FRIEND',	'ReductionValue',				-1),
		('AGENDA_SAILOR_LINCA_BAD_FRIEND',	'MessageThrottle',				20),
		('AGENDA_SAILOR_LINCA_BAD_FRIEND',	'StatementKey',					'LOC_DIPLO_KUDA_LEADER_SAILOR_LINCA_REASON_BAD_FRIEND'),
		('AGENDA_SAILOR_LINCA_BAD_FRIEND',	'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_SAILOR_LINCA_BAD_FRIEND');

-----------------------------------------------	
-- HistoricalAgendas
-----------------------------------------------	
INSERT INTO HistoricalAgendas
		(LeaderType,			AgendaType)
VALUES	('LEADER_SAILOR_LINCA',	'AGENDA_SAILOR_LINCA');

-----------------------------------------------	
-- ModifierStrings
-----------------------------------------------	
INSERT INTO ModifierStrings
		(ModifierId,						Context,		Text)
VALUES	('AGENDA_SAILOR_LINCA_GOOD_FRIEND',	'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_SAILOR_LINCA_BAD_FRIEND',	'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');
