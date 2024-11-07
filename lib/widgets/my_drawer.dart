import 'package:flutter/material.dart';
import '../utility/helpers.dart';
import 'my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/icons/app-logo.jpg',
              width: 100,
            )
          ),

          const SizedBox(height: 25),
          // routes in main.dart
          MyListTile(text: 'Каталог', icon: Icons.car_crash, onTap: () => Navigator.of(context).pushNamed('/catalog-screen')),
          MyListTile(text: 'Личный кабинет', icon: Icons.list, onTap: () => Navigator.of(context).pushNamed('/personal-screen')),

          SizedBox(height: Helpers().divider),

          const Text('v. 11.07.00'),
          const Text('Made By Mirkin Studio'),





        ],
      ),
    );
  }
}
