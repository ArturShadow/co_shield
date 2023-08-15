// Importamos las bibliotecas de Flutter necesarias.
import 'package:flutter/material.dart';
import 'drawer.dart'; // Importamos el widget "Menu", que es probablemente una especie de menú de navegación.

/// Función principal que se ejecuta al iniciar la aplicación.
Future main() async {
  // Inicialización (comentada en este momento).
  // await inicializar(null);

  // Arranca la aplicación Flutter con `MyApp` como widget raíz.
  return runApp(const MyApp());
}

/// Función para realizar una inicialización que toma 2 segundos.
/// Aunque está definida, actualmente está comentada y no se usa en la función main.
Future inicializar(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 2));
}

/// Representa el widget principal `MyApp` de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Elimina el banner de "debug" en la esquina superior derecha.
      home: Directionality(
        textDirection: TextDirection
            .ltr, // Establece la dirección del texto (izquierda a derecha en este caso).
        child: Menu(), // Usa el widget `Menu` como página principal.
      ),
    );
  }
}
