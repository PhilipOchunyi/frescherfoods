import 'package:flutter/material.dart';

import 'package:fresherfoods/ui/bookmarks_page.dart';
import 'package:fresherfoods/ui/camera_page.dart';
import 'package:fresherfoods/ui/conditions_page.dart';
import 'package:fresherfoods/ui/favorites_page.dart';
import 'package:fresherfoods/ui/gallery_list_page.dart';
import 'package:fresherfoods/ui/gallery_page.dart';
import 'package:fresherfoods/ui/groups_page.dart';

import 'package:fresherfoods/ui/logout_page.dart';
import 'package:fresherfoods/ui/notification_page.dart';

import 'package:fresherfoods/ui/profile_page.dart';

import 'package:fresherfoods/ui/search_page.dart';
import 'package:fresherfoods/ui/settings_page.dart';
import 'package:fresherfoods/ui/share_post_page.dart';

import 'package:fresherfoods/ui/support_page.dart';

import 'src/Features/Onboarding/Presentation/Pages/AutenticationPage/login.dart';
import 'src/Features/Onboarding/Presentation/Pages/AutenticationPage/password_forgotten.dart';
import 'src/Features/Onboarding/Presentation/Pages/AutenticationPage/register_page.dart';
import 'src/Features/Onboarding/Presentation/Pages/Screen/homepage.dart';
import 'src/Features/Onboarding/Presentation/Pages/WelcomePage/welcomepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get passwordforgotten => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme:
      //     ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      //theme: lightTheme,
      //darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      title: "Homepage",
      initialRoute: '/welcomepage',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/homepage': (context) => const HomePage(),
        '/camerapage': (context) => const CameraPage(),
        '/searchpage': (context) => const SearchPage(),
        '/notification': (context) => const NotificationPage(),
        '/welcomepage': (context) => const WelcomePage(),
        '/profilepage': (context) => const ProfilePage(),
        '/logout': (context) => const LogOutPage(),
        '/bookmarkspage': (context) => const BookmarksPage(),
        '/favoritespage': (context) => const FavoritesPage(),
        '/groupspage': (context) => const GroupsPage(),
        '/settingspage': (context) => const SettingsPage(),
        '/supportpage': (context) => const SupportPage(),
        '/gallerylistpage': (context) => const GalleryListPage(),
        '/gallerypage': (context) => const GalleryPage(),
        '/sharepostpage': (context) => const SharePostPage(),
        '/passwordforgotten': (context) => const PasswordForgottenPage(),
        '/conditionspage': (context) => const ConditionsPage(),
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
// Icon icon;
// String name = "";

//  int _indexClicked = 0;

//         child: Material(

//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(
//                 color: Colors.blueAccent,

//                 // image: DecorationImage(
//                 //   fit: BoxFit.fill,
//                 //   //image: AssetImage("assets/images/drawer.jpg"),
//                 // ),
//               ),
//               //Remove padding
//               padding: EdgeInsets.zero
//               child: Container(
//                 child: const Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     //Circular Avater
//                     CircleAvatar(
//                       radius: 20,
//                       backgroundImage: AssetImage("assets/images/profile.jpg"),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Text(
//                       "Max Mustermann",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "sanchez",
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "maxmustermann@web.de",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       Navigator.pop(context);
//                       setState(() {
//                         _indexClicked = 0;
//                       });
//                       Navigator.pop(context);
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const ProfilePage(),
//                       ));
// //Navigator.pop(context);
//                     },
//                     //hoverColor: hoverC,
//                     leading: Icon(
//                       Defaults.drawerItemIcon[0],
//                       size: 30,
// //If item[0] is selected then drawerselected color else draw item color
//                       color: _indexClicked == 0
//                           ? Defaults.drawerItemSelectedColor
//                           : Defaults.drawerItemColor,
//                     ),
//                     title: Text(
//                       Defaults.drawerItemText[0],
//                       style: TextStyle(
// //color: Colors.blueAccent,
//                         fontFamily: "sanchez",
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: _indexClicked == 0
//                             ? Defaults.drawerItemSelectedColor
//                             : Defaults.drawerItemColor,
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     onTap: () {
//                        Navigator.pop(context);
//                       setState(() {
//                         _indexClicked = 1;
//                       });
//                       Navigator.pop(context);
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const FavoritesPage(),
//                       ));
//                     },
//                     leading: Icon(
//                       Defaults.drawerItemIcon[1],
//                       size: 30,
// //If item[0] is selected then drawerselected color else draw item color
//                       color: _indexClicked == 1
//                           ? Defaults.drawerItemSelectedColor
//                           : Defaults.drawerItemColor,
//                     ),
//                     title: Text(
//                       Defaults.drawerItemText[1],
//                       style: TextStyle(
// //color: Colors.blueAccent,
//                         fontFamily: "sanchez",
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: _indexClicked == 1
//                             ? Defaults.drawerItemSelectedColor
//                             : Defaults.drawerItemColor,
//                       ),
//                     ),
//                   ),
//                   ListTile(

//                     onTap: () {
//                       Navigator.pop(context);
//                       setState(() {
//                         _indexClicked = 2;
//                       });
//                       Navigator.pop(context);
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const BookmarkPage(),
//                       ));
//                     },
//                     leading: Icon(

//                       Defaults.drawerItemIcon[2],
//                       size: 35,
// //If item[0] is selected then drawerselected color else draw item color
//                       color: _indexClicked == 2
//                           ? Defaults.drawerItemSelectedColor
//                           : Defaults.drawerItemColor,
//                     ),
//                     title: Text(
//                       Defaults.drawerItemText[2],
//                       style: TextStyle(
// //color: Colors.blueAccent,
//                         fontFamily: "sanchez",
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: _indexClicked == 2
//                             ? Defaults.drawerItemSelectedColor
//                             : Defaults.drawerItemColor,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 300.0),
//                   const Divider(
//                     color: Colors.black,
//                     indent: 3,
//                     endIndent: 3,
//                   ),
//                   ListTile(
//                     onTap: () {
//                       Navigator.pop(context);
//                       setState(() {
//                         _indexClicked = 3;
//                       });
//                       Navigator.pop(context);
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const GroupsPage(),
//                       ));

//                     },
//                     leading: Icon(
//                       Defaults.drawerItemIcon[3],
//                       size: 30,
// //If item[0] is selected then drawerselected color else draw item color
//                       color: _indexClicked == 3
//                           ? Defaults.drawerItemSelectedColor
//                           : Defaults.drawerItemColor,
//                     ),
//                     title: Text(
//                       Defaults.drawerItemText[3],
//                       style: TextStyle(
// //color: Colors.blueAccent,
//                         fontFamily: "sanchez",
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: _indexClicked == 3
//                             ? Defaults.drawerItemSelectedColor
//                             : Defaults.drawerItemColor,
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     onTap: () {
//                       Navigator.pop(context);
//                       setState(() {
//                         _indexClicked = 4;
//                       });
//                       Navigator.pop(context);
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const LogOutPage(),
//                       ));

//                     },
//                     leading: Icon(
//                       Defaults.drawerItemIcon[4],
//                       size: 30,
// //If item[0] is selected then drawerselected color else draw item color
//                       color: _indexClicked == 4
//                           ? Defaults.drawerItemSelectedColor
//                           : Defaults.drawerItemColor,
//                     ),
//                     title: Text(
//                       Defaults.drawerItemText[4],
//                       style: TextStyle(
// //color: Colors.blueAccent,
//                         fontFamily: "sanchez",
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: _indexClicked == 3
//                             ? Defaults.drawerItemSelectedColor
//                             : Defaults.drawerItemColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//   }
// }
