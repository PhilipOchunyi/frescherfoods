import 'package:flutter/material.dart';
import 'package:fresherfoods/src/Features/onboarding/presentation/widgets/nav_drawer.dart';
import 'package:fresherfoods/ui/search_page.dart';
import 'package:fresherfoods/src/Features/upload_items/presentation/camera_page.dart';
import 'package:fresherfoods/ui/notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// // Shows current index the bottom navigation bar

  int _currentIndex = 0;

  final List<Widget> _pages = const [
    SearchPage(),
    CameraPage(),
    NotificationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        titleTextStyle: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 25,
            fontWeight: FontWeight.w600),
        centerTitle: false,
      ),

      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      // Show the current page based on _currentIndex.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.house_outlined),
            label: "Home",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: "Camera",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: "Notification",
            backgroundColor: Colors.blueAccent,
          ),
        ],
      ),

      drawer: const NavDrawer(),
    );
  }
}
