-----------------------------------------------
-- PlayerColors
-----------------------------------------------
INSERT INTO Colors
        (Type,                          Color)
VALUES  ('COLOR_SAILOR_LINCA_PRIMARY', '120,94,20,255'),
        ('COLOR_SAILOR_LINCA_SECONDARY', '242,236,186,255'),
		('COLOR_SAILOR_LINCA_PRIMARY2', '64,56,48,255'),
		('COLOR_SAILOR_LINCA_SECONDARY2', '207,105,105,255');

-----------------------------------------------
-- PlayerColors
-----------------------------------------------
INSERT INTO PlayerColors (
		Type,
		Usage, 
		PrimaryColor, 
		SecondaryColor, 
		Alt1PrimaryColor, 
		Alt1SecondaryColor, 
		Alt2PrimaryColor, 
		Alt2SecondaryColor, 
		Alt3PrimaryColor, 
		Alt3SecondaryColor)
SELECT	'LEADER_SAILOR_LINCA',
		'Unique',
		'COLOR_SAILOR_LINCA_PRIMARY',
		'COLOR_SAILOR_LINCA_SECONDARY',
		'COLOR_SAILOR_LINCA_PRIMARY2',
		'COLOR_SAILOR_LINCA_SECONDARY2',
		Alt2PrimaryColor,
		Alt2SecondaryColor,
		PrimaryColor AS Alt3PrimaryColor,
		SecondaryColor AS Alt3SecondaryColor
FROM PlayerColors WHERE Type = 'LEADER_SAILOR_TOTORI';