Echo Descomprimiendo	%date% %time% >> LogActividadesSucursales.log
powershell -command "Expand-Archive -Force '%~dp0padron_reducido_local_anexo.zip' '%~dp0'" >> LogActividadesSucursales.log

