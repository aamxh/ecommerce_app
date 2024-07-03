import 'package:ecommerce_app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/controllers/main.dart';

class MainV extends StatelessWidget {

  const MainV({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<NavigationC>(
      init: NavigationC(),
      builder: (ctrl) => Scaffold(
        body: ctrl.widgets[ctrl.currentIdx],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: MyConstants.neutral,
          backgroundColor: theme.scaffoldBackgroundColor,
          selectedItemColor: theme.primaryColor,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wish-list',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          elevation: 0,
          currentIndex: ctrl.currentIdx,
          onTap: ctrl.updateIdx,
        ),
      ),
    );
  }

}