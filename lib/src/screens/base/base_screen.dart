import 'package:flutter/material.dart';
import 'package:greengrocer/src/screens/home/home_tab.dart';
import 'package:greengrocer/src/screens/orders/orders_tab.dart';
import 'package:greengrocer/src/screens/profile/profile_tab.dart';
import 'package:greengrocer/src/screens/cart/cart_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        backgroundColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
          pageController.jumpToPage(index);
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_rounded,
            ),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_rounded,
            ),
            label: 'Pedidios',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: 'Perfil',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
