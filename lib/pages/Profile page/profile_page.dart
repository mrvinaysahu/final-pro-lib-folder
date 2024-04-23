import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/colors.dart';
import 'package:yoga_trainer_app/const/customwidget_home.dart';
import 'package:yoga_trainer_app/const/variables.dart';
import 'package:yoga_trainer_app/pages/Auth%20page/signin_page.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    // var screenHeight = MediaQuery.of(context).size.height;

    void logOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: ((context) => SignInPage())));
    }

    const String imageUrl = appLogo;
    const double radius = 70.0;
    const double borderWidth = 2.0;
    final Color borderColor = maincolor;

    User? user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   // User is signed in
    //   String uid = user.uid;
    //   String? email = user.email;
    //   String? displayName = user.displayName;
    //   String? photoURL = user.photoURL;

    //   print('User UID: $uid');
    //   print('User Email: $email');
    //   print('User Display Name: $displayName');
    //   print('User Photo URL: $photoURL');
    // } else {

    //   print('No user signed in.');
    // }
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 25, bottom: 10),
                child: Column(
                  children: [
                    Container(
                      width: radius * 2,
                      height: radius * 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: borderColor,
                          width: borderWidth,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    sizedBox10(),
                    boldTextSize18(user?.email),
                    // Text(email),
                    sizedBox20(),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Log Out"),
                                    content: Text("Are you sure?"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            logOut();
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Log out",
                                          )),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cencle",
                                          )),
                                    ],
                                  ));
                        },
                        child: textSize18("Logout")),
                  ],
                ),
              ),
            ),
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                version,
                style: TextStyle(color: Colors.grey),
              ),
              // Text(
              //   "Vinay sahu",
              //   style: TextStyle(color: Colors.grey),
              // ),
            ],
          ),
          sizedBox20()
        ],
      ),
    ));
  }
}
