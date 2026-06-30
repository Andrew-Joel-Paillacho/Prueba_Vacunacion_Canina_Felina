
# Pokemon API

## Descripcion general
Aplicación móvil desarrollada en Flutter para la gestión de vacunación de mascotas, diseñada con tres roles específicos: Promotor, Brigadier y Vacunador. Se realizaron cambios en los roles por comodidad, el coordinador de campaña es el rol de Promotor, el coordinador de brigada es el Brigadier.


```bash
lib/
├── main.dart
└── pages/
    ├── login_page.dart
    ├── promotor/
    │   ├── promotor_dashboard.dart
    │   ├── crear_sector_page.dart
    │   ├── crear_coordinador_page.dart
    │   └── asignar_coordinador_page.dart
    ├── brigadier/
    │   ├── brigadier_dashboard.dart
    │   ├── crear_vacunador_page.dart
    │   ├── asignar_vacunador_page.dart
    │   └── corregir_registros_page.dart
    └── vacunador/
        ├── vacunador_dashboard.dart
        ├── registrar_vacunacion_page.dart
        └── editar_registros_page.dart
```

## Módulo de Login
### Características
Campos de entrada: Usuario y Contraseña
Selector de rol: Desplegable con tres opciones (promotor, brigadier, vacunador)
Navegación: Redirige al dashboard correspondiente según el rol seleccionado
    
## Credenciales de Prueba
en este caso se agregaron credenciales, pero funciona con cualquier nombre de Usuario.
Usuario: demo
Contraseña: 123
Roles disponibles: promotor, brigadier, vacunador

## Rol: Promotor

### Dashboard Principal
Aqui tenemos lo que es el dashboard este como se dijo en las caracteristicas de la aplicacion, esta nos presentara:
    Visualización de estadísticas generales (sectores totales, coordinadores, vacunaciones),
    Actividad reciente del sistema,
    Y en la parte inferir tenemos las demas funciones.

![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/promotor_1.png)

### Gestión de Sectores
Mostrara lo siguiente:
    Visualización de todos los sectores creados,
    Información del coordinador asignado,
    Número de vacunaciones por sector.

![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/promotor_2.png)

### Gestión de Coordinadores
Mostrara lo siguiente:
    Selección de sector,
    Selección de coordinador,
    Confirmación de asignación.

![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/promotor_3.png)

## Rol: Brigadier

### Dashboard 
Este dashboard nos presentara in interfaz que nos muestra lo siguiente:
    Visualización del sector asignado,
    Estadísticas (vacunadores, vacunaciones hoy, pendientes, completadas),
    Registros recientes de vacunación.
    
![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/brigadier_1.png)

### Gestión de Sectores Asignados
Mostrara lo siguiente:
    Lista de sectores bajo su responsabilidad,
    Número de vacunadores por sector,
    Vacunaciones del día.
    
![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/brigadier_2.png)

### Gestión de Vacunadores
Mostrara lo siguiente:
    Selección de sector,
    Selección de vacunador,
    Confirmación de asignación.
    
![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/brigadier_3.png)

### Corrección de Registros
Mostrara lo siguiente:
    Visualización del registro a corregir,
    Campo de nuevas observaciones,
    Confirmación de corrección.
    
![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/brigadier_4.png)

## Rol: Vacunador

### Dashboard Principal
Mostrara lo siguiente:
    Visualización del sector asignado,
    Estadísticas personales (mis registros, pendientes, completados),
    Últimos registros realizados.
    
![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/vacunador_1.png)


### Registro de Vacunación
    
![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/vacunador_2.png)

Al agregar una nueva vacunacion la informacion peresnetada sera la sguiente:
![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/vacunador_2_edit1.png)

![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/vacunador_2_edit2.png)

### Edición de Registros
    
![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/vacunador_3.png)


# SplashScreen

## Instalación

### Agrega la dependencia
Primero comenzamos agregando al archivo pubspec.yaml, la siguiente instancia:
```bash
dev_dependencies:
  flutter_native_splash: ^2.4.3
```

Tambien debemos de ejecutar lo siguiente:
```bash
flutter pub get
```

## Configuración

### Configura los parámetros en pubspec.yaml
Agregamos la sección flutter_native_splash al final del archivo (sin indentación, al mismo nivel que flutter: y dependencies:), tener en cuenta lo que escribo entre parentecis ya que por eso no me reconocia el SplashScreen:

```bash
flutter_native_splash:
  # Color de fondo
  color: "#FFFFFF"
  
  # Imagen principal
  image: assets/images/splash.png
  
  # Habilitar para Android e iOS
  android: true
  ios: true
  
  # Configuración específica para Android 12+
  android_12:
    color: "#FFFFFF"
    image: assets/images/splash.png
```

tener en cuenta que la imagen principal debe de ser png, en este caso use una generada por IA, en dimenciones de 1x1, para ajustarlo y hacerlo mas responsible dependiendo del dispositivo que se use. La configuracion para andriod +12 es importante ya que si no se realiza el SplashScreen no se mostrara.

En este caso agrege la siguiente instancia dentro de flutter: , para que indentifique la carpeta de los recursos:

```bash
  assets:
  - assets/images/
  ```

Al ultimo, ya realizado todo lo anterior mandaremos a correr lo siguiente:

```bash
# Limpia caché
flutter clean

# Vuelve a obtener dependencias
flutter pub get

# Genera con dart run
dart run flutter_native_splash:create
```

En mi caso tube problemas haciendo correr la ultima linea presentada anteriormente, pero el SplashScreen se muestra de todas formas.

## Captura del SplashScreen
![App Screenshot](https://github.com/Andrew-Joel-Paillacho/Prueba_Vacunacion_Canina_Felina/blob/main/recursos/splashscreem.png)

## Video de demostración
[![Video de demostración](https://youtu.be/C_QPBrbTD1A?si=R1S35_C-SXCBRTq7)
