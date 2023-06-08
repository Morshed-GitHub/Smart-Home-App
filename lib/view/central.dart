import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_app/view/home.dart';
import 'package:smart_home_app/view/production.dart';
import 'package:smart_home_app/view/search.dart';

class CentralScreen extends StatefulWidget {
  const CentralScreen({super.key});

  @override
  State<CentralScreen> createState() => _CentralScreenState();
}

class _CentralScreenState extends State<CentralScreen> {
  int selectedIndex = 0;
  final List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    ProductionScreen(title: "Grid"),
    ProductionScreen(title: "User"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        // Initially loads all the screens and store them on "Stack".
        // When user navigate them through "bottomNavigationBar", it
        // wont load every time, just navigate to the already loaded
        // scree. Improves user experience.
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          _buildNavigationBarItem(
            "home",
            "Home",
            selectedIndex == 0,
          ),
          _buildNavigationBarItem(
            "search",
            "Search",
            selectedIndex == 1,
          ),
          _buildNavigationBarItem(
            "grid",
            "Grid",
            selectedIndex == 2,
          ),
          _buildNavigationBarItem(
            "profile",
            "Profile",
            selectedIndex == 3,
          ),
        ],
      ),
    );
  }
}

BottomNavigationBarItem _buildNavigationBarItem(
  String svg,
  String label,
  bool isSelected,
) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      "assets/images/$svg.svg",
      height: 24,
      width: 24,
      colorFilter: ColorFilter.mode(
          isSelected ? const Color(0xffFFB267) : Colors.white, BlendMode.srcIn),
    ),
    label: label,
    backgroundColor: Colors.transparent,
  );
}
