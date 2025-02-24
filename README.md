# # QR Code managager

QR code manager es una aplicacion para escanear codigos QR y guardarlos en una base de datos local



Link para unirse en testflight
[https://testflight.apple.com/join/q7pAF8Gw)](Enlace%20para%20probar%20desde%20TestFlight)

Si el link aún no funciona por falta de aprobación en la tienda
no dude en contactarme para agregarlo al grupo interno de testflight 




## La aplicacion aún no esta completamente lista para Android

Aún no se ha terminado la implementación de lectura de QR en Android debido a que mi experiencia se basa más que todo en Flutter e iOS y aún no logré terminarla.

Pero como la mayoría de desarrolladores no me rindo y en el trascurso del día de hoy 24-02-2025 la tendré.

Si está funcional la implementacion de **fingerPrint o Huella** y aqui el link de descarga del apk [Link de descarga APK](https://drive.google.com/file/d/1UxCNO7C7i021v5yaPZP_p1sIUQisN2OP/view?usp=sharing)



## Proceso para ejecutar la app local 
Para ejecutar la app local solo debes lanzar la aplicación en un emulador iOS habilitando la función de faceID
No es necesario ningún proceso adicional, ya que todos los archivos generados ya están listos para su uso 

## Explicación de uso

1. La app en la primera visita entrará a la vista de login, para lo cual debes hacer un registro
2. En el registro, después de ingresar los datos, debes presionar autenticar con Face ID y darle a registrar, después de un registro exitoso esto te llevará de nuevo a la vista de login.
3. en la vista de login, será necesario que ingreses por primera vez los datos de autenticación y podrás ingresar al home
4. Después del primer login, siempre requerirá face ID de manera automática.
5. En el home solo será necesario presionar el botón de escanear nuevo QR.
6. Una vez escaneado te pedirá que le agregues un nombre,  si no se ingresa, le agregará uno por defecto, una vez ingresado debes darle registrar
7. Y listo aparecerá el listado de QR guardado
8. Al darle tap a un ítem se desplegará un modal con la información y si es un link aparecerá la opción de abrir en navegador 


## Arquitectura de aplicación 

La arquitectura se basa en una arquitectura modular junto con arquitectura limpia, se usan paquetes como Flutter modular que nos ayuda a gestionar las dependencias de cada modulo y manejar las rutas en la aplicación

## Estructura del proyecto

los paquetes que usa el app se encuentras en la carpeta packages.

- **qr_code_manager_auth**: se encarga de todo lo relacionado con autenticación
- **qr_code_manager_design_system**: Es un pequeño sistema de diseño basado en atomic design que proporciona componentes reutilizables.
- **qr_code_manager_qr_home**: es en donde se encuentra todo lo relacionado con el listado y creación de códigos QR 

dentro de cada paquete se encuentran las capas de :

- **infraestrcuture**: contiene todas las implementaciones del app
- **domain**: es donde se centran modelos, entidades e interfaces definidas por la logica de negocio
- **presentation**: donde se encuentra toda la UI 
- **app**: donde se crea la implementación de los casos de uso 

## Paquetes usados 
- **Drift**: para la gestión de la base de datos local
- **Flutter modular**: para el manejo de rutas y dependencias 
- **Bloc**: para la gestion de estados
- **Oxidized**: Para el uso del patron result 
- **Pigeon**: para la generación de código para uso en nativo 

por último como herramienta de análisis se usa **very_good_analysis**


  

