import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yoga_trainer_app/const/colors.dart';
import 'package:yoga_trainer_app/const/splash_screen.dart';
import 'package:yoga_trainer_app/const/variables.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: maincolor),
        useMaterial3: true,
      ),
      // home: const SignInPage(),
      home: const Splash_Screen(),
    );
  }
}
