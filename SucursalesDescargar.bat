Echo Descargando : https://www.sunat.gob.pe/descargaPRR/padron_reducido_local_anexo.zip	%date% %time% >> LogActividadesSucursales.log
powershell -command Invoke-WebRequest https://www.sunat.gob.pe/descargaPRR/padron_reducido_local_anexo.zip -OutFile padron_reducido_local_anexo.zip >> LogActividadesSucursales.log


