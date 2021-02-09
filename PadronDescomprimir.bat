Echo Descomprimiendo	%date% %time% >> LogActividades.log
powershell -command "Expand-Archive -Force '%~dp0padron_reducido_ruc.zip' '%~dp0'" >> LogActividades.log

