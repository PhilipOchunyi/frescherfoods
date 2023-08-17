import 'package:flutter/material.dart';
import 'package:fresherfoods/ui/camera_page.dart';
import 'package:fresherfoods/ui/homepage.dart';
import 'package:fresherfoods/ui/login.dart';
import 'package:fresherfoods/ui/notification_page.dart';
import 'package:fresherfoods/ui/notificationslist_page.dart';
import 'package:fresherfoods/ui/profile_page.dart';
import 'package:fresherfoods/ui/search_page.dart';
import 'package:fresherfoods/ui/settings_page.dart';
import 'package:fresherfoods/ui/sign_in_page.dart';
import 'package:fresherfoods/ui/success_page.dart';
import 'package:fresherfoods/ui/welcomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme:
      //     ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      title: "Homepage",
      initialRoute: '/homepage',
      routes: {
        '/login': (context) => const LoginPage(),
        '/homepage': (context) => const HomePage(title: 'Home'),
        '/camerapage': (context) => const CameraPage(),
        '/searchpage': (context) => const SearchPage(),
        '/notification': (context) => const NotificationPage(),
        '/notificatioonlist': (context) => const NotificationListPage(),
        '/signin': (context) => const SignInPage(),
        '/successpage': (context) => const SuccessPage(),
        '/welcomepage': (context) => const WelcomePage(),
        '/profilepage': (context) => const ProfilePage(title: 'Profile'),

        //Remove  profile title

        '/settingspage': (context) => const SettingsPage(),
        // '/home': (context) => const HomePage(title: 'Home'),
      },
      debugShowCheckedModeBanner: false,
    );

//       home: const MyAppPage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyAppPage extends StatefulWidget {
//   const MyAppPage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyAppPage> createState() => _MyAppPageState();
// }

// class _MyAppPageState extends State<MyAppPage> {
//   List tabs = [
//     SearchPage(),
    //   CameraPage(),
    //   NotificationPage(),
    // ];
    // @override
    // Widget build(BuildContext context) {
    //   SafeArea;

    //   return Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: Colors.blueAccent,
    //         title: Text("Fresher Foods"),
    //         titleTextStyle: TextStyle(
    //             color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
    //       ),
    //       body: Center(
    //         // Center is a layout widget. It takes a single child and positions it
    //         // in the middle of the parent.
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             const Text(
    //               'You have pushed the button this many times:',
    //             ),
    //           ],
    //         ),
    //       ),
    //       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    //       floatingActionButton: FloatingActionButton(
    //         child: Icon(Icons.add),
    //         onPressed: () {},
    //         backgroundColor: Colors.blueAccent,
    //         shape: CircleBorder(),
    //       ),
    //       bottomNavigationBar: BottomNavigationBar(
    //         type: BottomNavigationBarType.fixed,
    //         iconSize: 30,
    //         selectedFontSize: 20,
    //         unselectedFontSize: 10,
    //         items: [
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.apps),
    //             label: "Home",
    //             backgroundColor: Colors.blue,
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.search),
    //             label: "Search",
    //             backgroundColor: Colors.blue,
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.camera),
    //             label: "Camera",
    //             backgroundColor: Colors.blue,
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.notifications_active),
    //             label: "Notification",
    //             backgroundColor: Colors.0C30EE,
    //           ),
    //         ],
    //       ));
    //     // This trailing comma makes auto-formatting nicer for build methods.
    // }
  }
}
