import 'package:breezy_look/modules/data/navigation_provider.dart';
import 'package:breezy_look/screens/add_items.dart';
import 'package:breezy_look/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:breezy_look/screens/home_screen.dart';
import 'package:breezy_look/screens/wardrobe_screen.dart';
import 'package:breezy_look/screens/placeholder_screen.dart';
import 'package:breezy_look/config/themes/theme_light.dart';

class AppNavigation extends StatelessWidget {
  AppNavigation({super.key});

  final List<Widget> _screens = [
    HomeScreen(),
    WardrobeScreen(),
    PlaceholderScreen(title: "Weather"),
    ProfileScreen(),
  ];

  final List<String> _navIcons = [
    'home',
    'wardrobe',
    'weather',
    'profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Consumer<NavigationProvider>(
          builder: (context, navProvider, child) {
            return _screens[navProvider.currentIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const AddItemsScreen()),
        ),
        backgroundColor: AppTheme.primaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              color: Colors.transparent,
              elevation: 0,
              child: Consumer<NavigationProvider>(
                  builder: (context, navProvider, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(_navIcons.length, (index) {
                    final isSelected = navProvider.currentIndex == index;
                    return IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/${_navIcons[index]}-${isSelected ? 'active' : 'inactive'}.svg",
                        colorFilter: ColorFilter.mode(
                          isSelected ? AppTheme.primaryColor : Colors.grey,
                          BlendMode.srcIn,
                        ),
                      ),
                      onPressed: () {
                        navProvider.setIndex(index);
                      },
                    );
                  }),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
