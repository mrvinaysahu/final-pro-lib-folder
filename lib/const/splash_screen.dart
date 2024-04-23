import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga_trainer_app/const/bottom_Navi_bar.dart';
import 'package:yoga_trainer_app/const/colors.dart';
import 'package:yoga_trainer_app/const/variables.dart';
import 'package:yoga_trainer_app/pages/Auth%20page/signin_page.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (_) => (FirebaseAuth.instance.currentUser != null)
              ? const BottomBar()
              : const SignInPage()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // print("height${ screenHeight}");
    // height820.5714285714286
    var screenWidth = MediaQuery.of(context).size.width;
    // print("width${ screenWidth}");
    // width411.42857142857144
    return Scaffold(
      backgroundColor: secondcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              appLogo,
              height:
                  screenHeight < 480 ? screenWidth / 2.50 : screenHeight / 2.50,
            ),
          ),
          Text(
            appName,
            style: TextStyle(
                fontSize: 33, fontWeight: FontWeight.bold, color: maincolor),
          )
        ],
      ),
    );
  }
}
