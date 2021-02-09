Echo Iniciando volcado de datos	%date% %time% >> LogActividades.log
Set currntDir=%~dp0
Set fileDataTxt=%currntDir%padron_reducido_ruc.txt
Set fileCommand=InstruccionesPadronSQL.txt
Echo %fileCommand%
rem --------------------------------
Set server=IKHER1024\SQLEXPRESS
Set dataBs=PADRONSUNAT
Set tablex=dbo.Contribuyentes
Set userId=sa
Set passwd=123456789
rem --------------------------------
Echo TRUNCATE TABLE %tablex% 	>> %fileCommand%
Echo GO 			>> %fileCommand%
Echo BULK INSERT %tablex%	>> %fileCommand%
Echo FROM "%fileDataTxt%"	>> %fileCommand%
Echo WITH (			>> %fileCommand%
Echo 	 FIRSTROW = 2		>> %fileCommand%
Echo 	,DATAFILETYPE = "char"  >> %fileCommand%
Echo 	,ROWS_PER_BATCH  = 100  >> %fileCommand%
Echo 	,FIELDTERMINATOR = "|"  >> %fileCommand%
Echo 	,ROWTERMINATOR = "0x0a" >> %fileCommand%
Echo )				>> %fileCommand%
Echo GO				>> %fileCommand%
SQLCMD -S %server% -d %dataBs% -U %userId% -P %passwd% -i %fileCommand% -o LogActividades.log
Echo Termino el volcado de datos	%date% %time% >> LogActividades.log
Del %fileCommand%
