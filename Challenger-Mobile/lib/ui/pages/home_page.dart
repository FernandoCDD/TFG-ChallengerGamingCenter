import 'package:challenger_api_front/ui/pages/info_page.dart';
import 'package:challenger_api_front/ui/pages/my_profile_page.dart';
import 'package:challenger_api_front/ui/pages/reservas_page.dart';
import 'package:challenger_api_front/ui/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    InfoPage(),
    const ReservasPage(),
    const ShopPage(),
    const UserProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        toolbarHeight: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'RESERVAR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'TIENDA',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'MI PERFIL',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFE96C26),
        unselectedItemColor: Colors.grey[700],
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(color: Colors.orange),
        unselectedLabelStyle: TextStyle(color: Colors.grey[700]),
        iconSize: 30,
      ),
    );
  }
}
