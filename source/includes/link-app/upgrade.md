# Actualización

Para actualizar el programa Link de Dátil

* Abra el terminal de windows y detenga el servicio:

`net stop datilink`

* Respalde la carpeta de configuración  `config`

Windows: `C:\Archivos de Programa\Datil\Link\config` .

* Doble click en el desinstalador:

Windows: `C:\Archivos de Programa\Datil\Link\unins`

Dentro del directorio de instalación solo debe quedar la carpeta `logs`. Si otro
archivo o carpeta sigue existiendo, borrarlo.

* Instalar la nueva versión ejecutando el instalador de Link

* Reemplazar la carpeta config recién instalada con la carpeta config respaldada previamente

* Iniciar el servicio con el comando:

`net start datilink`

