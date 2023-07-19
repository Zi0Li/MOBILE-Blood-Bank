import 'package:flutter/material.dart';

class NavigationAppBar extends StatefulWidget {
  const NavigationAppBar({super.key});

  @override
  State<NavigationAppBar> createState() => _NavigationAppBarState();
}

class _NavigationAppBarState extends State<NavigationAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35,
            ),
            label: 'Home',
            backgroundColor: Color.fromRGBO(231, 53, 38, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: 35,
            ),
            label: 'Notificação',
            backgroundColor: Color.fromRGBO(231, 53, 38, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 35,
            ),
            label: 'Perfil',
            backgroundColor: Color.fromRGBO(231, 53, 38, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help_outline,
              size: 35,
            ),
            label: 'Duvidas',
            backgroundColor: Color.fromRGBO(231, 53, 38, 1),
          ),
        ],
      );
  }
}