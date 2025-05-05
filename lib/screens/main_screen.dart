import 'package:breezy_look/screens/wardrobe_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:breezy_look/screens/home_screen.dart';
import 'package:breezy_look/screens/placeholder_screen.dart';
import 'package:breezy_look/screens/add_items.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    WardrobeScreen(),
    PlaceholderScreen(title: "Weather", username: null),
    PlaceholderScreen(title: "Profile", username: "Dan"),
  ];

  final List<String> _navIcons = [
    'home',
    'wardrobe',
    'weather',
    'profile', // Name of SVG-Data
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemsScreen()),
          );
        },
        backgroundColor: AppTheme.primaryColor,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: AppTheme.backgroundColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: AppTheme.teritaryColor,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildNavItem(0),
            _buildNavItem(1),
            SizedBox(width: 40),
            _buildNavItem(2),
            _buildNavItem(3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    bool isSelected = _currentIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/${_navIcons[index]}-${isSelected ? 'active' : 'inactive'}.svg",
            fit: BoxFit.contain,
            height: 40,
            colorFilter: ColorFilter.mode(
              isSelected ? AppTheme.primaryColor : Colors.white,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () => setState(() {
            _currentIndex = index;
          }),
        ),
      ],
    );
  }
}
