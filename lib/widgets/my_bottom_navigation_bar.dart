import 'package:europark/screens/about_screen.dart';
import 'package:europark/screens/catalog_screen.dart';
import 'package:europark/screens/personal_screen.dart';
import 'package:europark/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {

  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    var curRouteName = ModalRoute.of(context)?.settings.name;
    List<String> routeNames = [
      WelcomeScreen.routeName,
      CatalogScreen.routeName,
      PersonalScreen.routeName,
      AboutScreen.routeName
    ];
    int currentIndex = 0;
    if(routeNames.contains(curRouteName!)) currentIndex = routeNames.indexOf(curRouteName!);
    else currentIndex = -1;

    if(curRouteName == WelcomeScreen.routeName) currentIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        currentIndex = index;
        Navigator.of(context).pushNamed(routeNames[currentIndex]);
      });
    }

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_awesome_motion),
          label: 'Каталог',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Личный кабинет',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.pin_drop_outlined),
          label: 'Контакты',
        ),

      ],
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey
      ),
      unselectedFontSize: 10,
      unselectedItemColor: Colors.grey,
      selectedItemColor: (currentIndex != -1) ?  Colors.black : Colors.grey,
      currentIndex: (currentIndex != -1) ? currentIndex : 0,
      onTap: _onItemTapped
    );
  }
}
