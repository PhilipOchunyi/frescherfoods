import 'package:flutter/material.dart';
import 'package:fresherfoods/ui/profile_page.dart';
import 'package:fresherfoods/ui/settings_page.dart';

import 'package:fresherfoods/widgets/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.onSignedOut, required this.userId});

  //final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// // Shows current index the bottom navigation bar

  int _currentIndex = 0;
  String _title = "";

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void setIndex(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'FresherFood';
          }
          break;
        case 1:
          {
            _title = 'Search';
          }
          break;
        case 2:
          {
            _title = 'Camera';
          }
          break;
        case 3:
          {
            _title = 'Notification';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        //backgroundColor: Colors.blueAccent,
        title: Text(_title),
        titleTextStyle: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 25,
            fontWeight: FontWeight.w600),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ));
            },
            icon: const Icon(Icons.settings),
            color: Colors.blueAccent,
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: setIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 20,
        unselectedFontSize: 10,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "Camera",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: "Notification",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        //backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      drawer: const NavigationDrawerWidget(),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
