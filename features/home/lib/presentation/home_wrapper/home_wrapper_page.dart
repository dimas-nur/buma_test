import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../home.gm.dart';

@RoutePage()
class HomeWrapperPage extends StatefulWidget {
  const HomeWrapperPage({super.key});

  @override
  State<HomeWrapperPage> createState() => _HomeWrapperPageState();
}

class _HomeWrapperPageState extends State<HomeWrapperPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ChatRoute(),
        FeedRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: _BottomNavigationMenu.menus.map(
            (tab) {
              return NavigationDestination(
                icon: Icon(tab.icon),
                label: tab.label,
              );
            },
          ).toList(),
        );
      },
    );
  }
}

class _BottomNavigationMenu {
  const _BottomNavigationMenu(
    this.icon,
    this.label,
  );

  final IconData icon;
  final String label;

  static const List<_BottomNavigationMenu> menus = [
    _BottomNavigationMenu(Icons.home, 'Home'),
    _BottomNavigationMenu(Icons.chat_rounded, 'Chat'),
    _BottomNavigationMenu(Icons.feed_rounded, 'Feed'),
    _BottomNavigationMenu(Icons.person, 'Profile'),
  ];
}
