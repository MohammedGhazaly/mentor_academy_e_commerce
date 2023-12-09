import 'package:flutter/material.dart';
import 'package:mentor_academy_e_commerce/screens/modules/home.dart';

class RootScreen extends StatefulWidget {
  static String routeName = "root-screen";
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      Container(),
      Container(),
    ];
    return Scaffold(
      body: screens[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (newPageIndex) {
          currentPageIndex = newPageIndex;
          setState(() {});
        },
        currentIndex: currentPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text("0"),
              child: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text("0"),
              child: Icon(
                Icons.favorite,
              ),
            ),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
