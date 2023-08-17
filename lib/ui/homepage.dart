// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:fresherfoods/ui/profile_page.dart';

import 'defaults.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //initialRoute: "/login",

      // routes: {
      //   '/home': (context) => const HomePage(title: 'Home'),
      //   '/search_page': (context) => const SearchPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexClicked = 0;
  final tabs = [
    const Center(child: Text("Home")),
    const Center(child: Text("Search")),
    const Center(child: Text("Camera")),
    const Center(child: Text("Notification")),
  ];

  final pages = [
    const Center(
      child: Text("Profile"),
    ),
    const Center(
      child: Text("Bookmark"),
    ),
    const Center(
      child: Text("Settings"),
    ),
    const Center(
      child: Text("Log Out"),
    ),
  ];
  Function updateState(int index) {
    return () {
      setState(() {
        _indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

  int _currentIndex = 0;

  void setIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SafeArea;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        //backgroundColor: Colors.blueAccent,
        title: const Center(child: Text("Fresher Food")),
        titleTextStyle: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 25,
            fontWeight: FontWeight.w900),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _currentIndex,
        onTap: setIndex,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        //backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                // image: DecorationImage(
                //   fit: BoxFit.fill,
                //   //image: AssetImage("assets/images/drawer.jpg"),
                // ),
              ),
              //Remove padding
              padding: EdgeInsets.zero,
              child: Container(
                child: const Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    //Circular Avater
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Max Mustermann",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "sanchez",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "maxmustermann@web.de",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    onTap: () {
                      setState(() {
                        _indexClicked = 0;
                      });
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfilePage(
                          title: 'Profile',
                        ),
                      ));
                      //Navigator.pop(context);
                    },
                    leading: Icon(
                      Defaults.drawerItemIcon[0],
                      size: 30,
                      //If item[0] is selected then drawerselected color else draw item color
                      color: _indexClicked == 0
                          ? Defaults.drawerItemSelectedColor
                          : Defaults.drawerItemColor,
                    ),
                    trailing: const Icon(Icons.arrow_right),
                    title: Text(
                      Defaults.drawerItemText[0],
                      style: TextStyle(
                        //color: Colors.blueAccent,
                        fontFamily: "sanchez",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: _indexClicked == 0
                            ? Defaults.drawerItemSelectedColor
                            : Defaults.drawerItemColor,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _indexClicked = 1;
                      });
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const FavoritePage(
                      //     title: 'Favorites',
                      //   ),
                      // ));
                    },
                    leading: Icon(
                      Defaults.drawerItemIcon[1],
                      size: 30,
                      //If item[0] is selected then drawerselected color else draw item color
                      color: _indexClicked == 1
                          ? Defaults.drawerItemSelectedColor
                          : Defaults.drawerItemColor,
                    ),
                    trailing: const Icon(Icons.arrow_right),
                    title: Text(
                      Defaults.drawerItemText[1],
                      style: TextStyle(
                        //color: Colors.blueAccent,
                        fontFamily: "sanchez",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: _indexClicked == 1
                            ? Defaults.drawerItemSelectedColor
                            : Defaults.drawerItemColor,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _indexClicked = 2;
                      });
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const BookmarkPage(
                      //     title: 'Bookmarks',
                      //   ),
                      // ));
                      // //Navigator.pop(context);
                    },
                    leading: Icon(
                      Defaults.drawerItemIcon[2],
                      size: 35,
                      //If item[0] is selected then drawerselected color else draw item color
                      color: _indexClicked == 2
                          ? Defaults.drawerItemSelectedColor
                          : Defaults.drawerItemColor,
                    ),
                    trailing: const Icon(Icons.arrow_right),
                    title: Text(
                      Defaults.drawerItemText[2],
                      style: TextStyle(
                        //color: Colors.blueAccent,
                        fontFamily: "sanchez",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: _indexClicked == 2
                            ? Defaults.drawerItemSelectedColor
                            : Defaults.drawerItemColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 300.0),
                  const Divider(
                    color: Colors.black,
                    indent: 3,
                    endIndent: 3,
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _indexClicked = 3;
                      });
                      Navigator.pop(context);
                    },
                    leading: Icon(
                      Defaults.drawerItemIcon[3],
                      size: 30,
                      //If item[0] is selected then drawerselected color else draw item color
                      color: _indexClicked == 3
                          ? Defaults.drawerItemSelectedColor
                          : Defaults.drawerItemColor,
                    ),
                    trailing: const Icon(Icons.arrow_right),
                    title: Text(
                      Defaults.drawerItemText[3],
                      style: TextStyle(
                        //color: Colors.blueAccent,
                        fontFamily: "sanchez",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: _indexClicked == 3
                            ? Defaults.drawerItemSelectedColor
                            : Defaults.drawerItemColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
