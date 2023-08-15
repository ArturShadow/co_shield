// Importamos las bibliotecas de Flutter necesarias para la interfaz de usuario.
import 'package:flutter/material.dart';
// Importamos el componente "gauges", que probablemente muestra algún tipo de gráfico o indicador.
import 'package:co_shield_2_0/gauges.dart';

/// La clase `Menu` representa la pantalla principal de la aplicación.
/// Esta pantalla contiene una barra superior (AppBar) con el título "CO SHIELD",
/// un cuerpo que muestra el componente `GaugeApp` y un cajón de navegación lateral (`NavigationDrawer`).
class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('CO SHIELD'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade700,
        ),
        body: const GaugeApp(),
        drawer: const NavigationDrawer(),
      );
}

/// La clase `NavigationDrawer` representa el cajón de navegación lateral
/// que proporciona opciones para navegar a diferentes pantallas de la aplicación.
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ]));

  /// Crea el encabezado del cajón de navegación.
  /// Actualmente, solo tiene un relleno en la parte superior, pero podría personalizarse en el futuro.
  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  /// Crea y retorna la lista de opciones del menú en el cajón de navegación.
  /// Actualmente tiene dos opciones: Home y Estadísticas.
  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(runSpacing: 16, children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pop(); // Cierra el Drawer
            // Navega a la pantalla Home usando Navigator.
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.area_chart),
          title: const Text('Estadisticas'),
          onTap:
              () {}, // Actualmente, esta opción no realiza ninguna acción al ser presionada.
        ),
      ]));
}

/// La clase `HomeScreen` representa una pantalla llamada "Home".
/// Esta pantalla tiene una barra superior con el título "Home" y muestra el componente `GaugeApp` en el cuerpo.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.blue.shade700,
        ),
        body: const GaugeApp(),
      );
}
