import 'package:flutter/material.dart';
import 'package:fresherfoods/src/Features/Onboarding/Presentation/widgets/navigation_drawer_widget.dart';
import 'package:fresherfoods/ui/camera_page.dart';
import 'package:fresherfoods/ui/notification_page.dart';
import 'package:fresherfoods/ui/search_page.dart';
//import 'package:fresherfoods/ui/share_post_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

//import 'package:fresherfoods/widgets/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// // Shows current index the bottom navigation bar

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const SearchPage(),
    const CameraPage(),
    const NotificationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        //backgroundColor: Colors.blueAccent,
        //title: Text(_title),
        titleTextStyle: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 25,
            fontWeight: FontWeight.w600),
        centerTitle: false,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => const SharePostPage(),
        //       ));
        //     },
        //     icon: const Icon(Icons.share),
        //     color: Colors.blueAccent,
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1,
          height: MediaQuery.sizeOf(context).height * .8,
          child: _pages[_currentIndex],
        ),
      ), // Show the current page based on _currentIndex.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 20,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home_outlined),
            label: "Home",
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
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   shape: const CircleBorder(),
      //   //backgroundColor: Colors.blueAccent,
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButton: SpeedDial(
        //Speed dial menu
        //marginBottom: 10, //margin bottom
        icon: Icons.add, //icon on Floating action button
        activeIcon: Icons.close, //icon when menu is expanded on button
        backgroundColor: Colors.blueAccent, //background color of button
        foregroundColor: Colors.white, //font color, icon color in button
        activeBackgroundColor:
            Colors.blueAccent, //background color when menu is expanded
        activeForegroundColor: Colors.white,
        buttonSize: const Size(56.0, 56.0), //button size
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () {}, // action when menu opens
        // ignore: avoid_print
        onClose: () => print('DIAL CLOSED'), //action when menu closes

        elevation: 8.0, //shadow elevation of button
        shape: const CircleBorder(), //shape of button

        children: [
          SpeedDialChild(
            //speed dial child
            child: const Icon(Icons.accessibility),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blueAccent,
            label: 'First Menu Child',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {},
          ),
          SpeedDialChild(
            child: const Icon(Icons.brush),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            label: 'Second Menu Child',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {},
          ),
          SpeedDialChild(
            child: const Icon(Icons.keyboard_voice),
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            label: 'Third Menu Child',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {},
          ),

          //add more menu item childs here
        ],
      ),

      drawer: const NavigationDrawerWidget(),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
