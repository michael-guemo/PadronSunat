Echo Descargando : http://www2.sunat.gob.pe/padron_reducido_ruc.zip	%date% %time% >> LogActividades.log
powershell -command Invoke-WebRequest http://www2.sunat.gob.pe/padron_reducido_ruc.zip -OutFile padron_reducido_ruc.zip  >> LogActividades.log


