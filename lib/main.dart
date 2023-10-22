import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:fresherfoods/my_app.dart';
import 'package:fresherfoods/src/Features/Onboarding/Domain/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>("userBox");git 
  runApp(const MyApp());
}
