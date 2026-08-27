DESPENSA JL - VERSION COMPLETA DE PRUEBA

1) Subir a GitHub Pages:
   - index.html
   - manifest.json
   - service-worker.js
   - icon-192.png
   - icon-512.png
   - supabase_migration.sql (este último NO es necesario para que la interfaz abra)

2) En Supabase ejecutar supabase_migration.sql una sola vez para agregar las tablas/campos de la versión completa.

3) La app ya incluye el Project URL y Publishable key que el usuario proporcionó. La publishable key está pensada para cliente web; nunca colocar service_role/secret keys aquí.

4) Datos de prueba:
   - Se crean automáticamente 50 productos la primera vez si el almacenamiento local está vacío.
   - Administrador: PIN 1234
   - Vendedor: PIN 1111
   - Precios y stocks son ficticios.

5) Escáner:
   - El botón azul/celeste ESCANEAR está fijo abajo en Ventas.
   - Usa BarcodeDetector cuando el navegador lo admite y ofrece entrada manual como respaldo.
   - Un lector USB/Bluetooth que actúe como teclado puede escribir el código en el buscador.

6) Fotos:
   - Se pueden cargar desde galería o cámara y se recortan a cuadrado.
   - En esta versión de prueba se guardan como datos de imagen en la fila del producto. Para catálogos grandes conviene migrar las fotos a Supabase Storage.

7) Ticket:
   - Formato visual de 80 mm y botón Imprimir.
   - Compartir usa Web Share cuando está disponible y WhatsApp web como alternativa.

8) Seguridad:
   - Esta es una versión de prueba. Las políticas públicas existentes en el proyecto permiten acceso amplio. Antes de usarla con datos reales hay que configurar Supabase Auth + RLS por usuario/rol.
