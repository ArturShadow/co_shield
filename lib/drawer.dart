import 'package:flutter/material.dart';
import 'package:co_shield_2_0/gauges.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('CO SHIELD'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade700,
        ),
        body: GaugeApp(),
        drawer: const NavigationDrawer(),
      );
}

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
  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(runSpacing: 16, children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const GaugeApp(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.area_chart),
          title: const Text('Estadisticas'),
          onTap: () {},
        ),
      ]));
}
