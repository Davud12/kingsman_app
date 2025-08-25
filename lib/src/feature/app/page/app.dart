import 'package:flutter/material.dart';
import 'package:kingsman_app/src/feature/designer/page/designer_page.dart';
import 'package:kingsman_app/src/feature/favourites/page/favourites_page.dart';
import 'package:kingsman_app/src/feature/home/page/home_page.dart';
import 'package:kingsman_app/src/feature/user/page/user_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectIndex = 0;

  List<Widget> peges = [
    HomePage(),
    FavouritesPage(),
    const DesignerPage(),

    const UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: peges[selectIndex],
            bottomNavigationBar: ClipRRect(
              child: NavigationBar(
                labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                  (Set<WidgetState> states) =>
                      states.contains(WidgetState.selected)
                          ? const TextStyle(
                            color: Color.fromARGB(255, 36, 36, 33),
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          )
                          : const TextStyle(
                            color: Color(0xFF6A6A60),
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                ),
                // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                height: 68,
                selectedIndex: selectIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    selectIndex = index;
                  });
                },
                indicatorColor: const Color.fromARGB(255, 36, 36, 33),
                destinations: [
                  NavigationDestination(
                    icon: const Icon(
                      Icons.home_filled,
                      color: Color(0xFF474747),
                    ),
                    label: 'Главная',
                    selectedIcon: const Icon(
                      Icons.home_filled,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  NavigationDestination(
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      color: Color(0xFF474747),
                    ),
                    label: 'Избраное',
                    selectedIcon: const Icon(
                      Icons.favorite_border_rounded,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  // NavigationDestination(
                  //   icon: const Icon(
                  //     Icons.forum_rounded,
                  //     color: Color(0xFF474747),
                  //   ),
                  //   label: 'ИИ чат',
                  //   selectedIcon: const Icon(
                  //     Icons.person_outline_rounded,
                  //     color: Color.fromARGB(255, 255, 255, 255),
                  //   ),
                  // ),
                  NavigationDestination(
                    icon: const Icon(
                      Icons.settings_accessibility_rounded,
                      color: Color(0xFF474747),
                    ),
                    label: 'Образ',
                    selectedIcon: const Icon(
                      Icons.settings_accessibility_rounded,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  NavigationDestination(
                    icon: const Icon(
                      Icons.person_outline_rounded,
                      color: Color(0xFF474747),
                    ),
                    label: 'Профиль',
                    selectedIcon: const Icon(
                      Icons.person_outline_rounded,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
