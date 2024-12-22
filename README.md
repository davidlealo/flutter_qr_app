# Flutter QR App

Esta es una aplicación de Flutter diseñada para escanear códigos QR o permitir la entrada manual de un número. Incluye un chat en la parte inferior que responde a comandos específicos para abrir la cámara o realizar otras acciones.

---

## Características principales

1. **Escaneo de códigos QR**: Abre la cámara para escanear un código QR.
2. **Entrada manual**: Permite ingresar un número en un campo de texto.
3. **Chat interactivo**: Un chat que detecta comandos para interactuar con la funcionalidad de la app.

---

## Instalación

### Requisitos previos

- Tener instalado [Flutter](https://flutter.dev/docs/get-started/install) en tu máquina.
- Un emulador o dispositivo físico conectado para probar la aplicación.

### Pasos

1. Clona este repositorio:
   ```bash
   git clone https://github.com/TU_USUARIO/flutter_qr_app.git
   cd flutter_qr_app
   ```

2. Instala las dependencias de Flutter:
   ```bash
   flutter pub get
   ```

3. Ejecuta la app en un emulador o dispositivo:
   ```bash
   flutter run
   ```

---

## Uso

### Pantalla principal

- **Cámara QR**: Presiona el botón "Abrir cámara" para navegar a la pantalla de escaneo de QR.
- **Input de número**: Introduce un número en el campo de texto.
- **Chat**: Escribe un comando para realizar acciones específicas.

### Comando en el chat

- `abrir cámara`: Navega directamente a la pantalla para escanear el código QR.

---

## Estructura del proyecto

- **`main.dart`**: Configuración principal de la app.
- **`screens/home_screen.dart`**: Pantalla principal con el chat, cámara y entrada de número.
- **`screens/qr_scanner_screen.dart`**: Pantalla para escanear códigos QR.
- **`widget_test.dart`**: Archivo de pruebas para verificar funcionalidad básica.

---

## Pruebas

Ejecuta las pruebas de widgets para verificar la funcionalidad básica:
```bash
flutter test
```

---

## Tecnologías utilizadas

- **Flutter**: Framework para desarrollar aplicaciones móviles multiplataforma.
- **qr_code_scanner**: Biblioteca para manejar el escaneo de códigos QR.
- **provider**: Gestión de estado para simplificar la comunicación entre widgets.

---

## Contribuciones

1. Haz un fork del proyecto.
2. Crea una nueva rama:
   ```bash
   git checkout -b feature/nueva-funcionalidad
   ```
3. Haz tus cambios y súbelos:
   ```bash
   git add .
   git commit -m "Descripción de los cambios"
   git push origin feature/nueva-funcionalidad
   ```
4. Abre un pull request.

---

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más información.

---

¡Gracias por usar esta aplicación! Si tienes preguntas o comentarios, no dudes en abrir un issue en este repositorio.

