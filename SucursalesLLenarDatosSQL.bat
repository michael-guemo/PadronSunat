Echo Iniciando volcado de datos	%date% %time% >> LogActividadesSucursales.log
Set currntDir=%~dp0
Set fileDataTxt=%currntDir%padron_reducido_local_anexo.txt
Set fileCommand=InstruccionesSucursalSQL.txt
Echo %fileCommand%
rem --------------------------------
Set server=IKHER1024\SQLEXPRESS
Set dataBs=PADRONSUNAT
Set tablex=dbo.LocalesXContribuyente
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
SQLCMD -S %server% -d %dataBs% -U %userId% -P %passwd% -i %fileCommand% -o LogActividadesSucursales.log
Echo Termino el volcado de datos	%date% %time% >> LogActividadesSucursales.log
Del %fileCommand%
