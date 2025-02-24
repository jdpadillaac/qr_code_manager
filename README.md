# # QR Code managager

QR code manager es una aplicacion para escanear codigos QR y guardarlos en una base de datos local



Link para unirse en testflight
[https://testflight.apple.com/join/q7pAF8Gw)](Enlace%20para%20probar%20desde%20TestFlight)

Si el link aún no funciona por falta de aprobación en la tienda
no dude en contactarme para agregarlo al grupo interno de testflight 



## La aplicacion aún no esta para Android

Aún no se ha terminado la implementación en Android debido a que mi experiencia se basa más que todo en Flutter e iOS y aún no logré terminarla.
Pero como la mayoría de desarrolladores no me rindo y en el trascurso del día de hoy 24-02-2025 la tendré 


## Proceso para ejecutar la app local 
Para ejecutar la app local solo debes lanzar la aplicación en un emulador iOS habilitando la función de faceID
No es necesario ningún proceso adicional, ya que todos los archivos generados ya están listos para su uso 

## Explicación de uso

1. La app en la primera visita entrará a la vista de login, para lo cual debes hacer un registro
2. En el registro, después de ingresar los datos, debes presionar autenticar con Face ID y darle a registrar, después de un registro exitoso esto te llevará de nuevo a la vista de login.
3. en la vista de login, será necesario que ingreses por primera vez los datos de autenticación y podrás ingresar al home
4. Después del primer login, siempre requerirá face ID de manera automática.
5. En el home solo sera necesario presionar el boton de escanear nuevo QR.
6. Una vez escaneado te pedirá que le agregues un nombre,  si no se ingresa le agregara uno le agregara uno por defecto, una vez ingresado debes darle registrar
7. Y listo aparecerá el listado de QR guardado
8. Al darle tap a un item se desplegará un modal con la información y si es un link aparecerá la opcion de abrir en navegador 

## Arquitectura de aplicación 

La arquitectura esta basada en arquitectura limpia