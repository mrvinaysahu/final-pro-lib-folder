import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yoga_trainer_app/const/bottom_Navi_bar.dart';
import 'package:yoga_trainer_app/const/variables.dart';
import 'package:yoga_trainer_app/pages/Auth%20page/signin_page.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
//firebase Authentication
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController cpassController = TextEditingController();
    TextEditingController passController = TextEditingController();
    //create account for a new  user in firebase
    void createAccount() async {
      String email = emailController.text.trim();
      String password = passController.text.trim();
      String cpassword = cpassController.text.trim();
      String name = nameController.text.trim();
      if (email == "" || password == "" || name == "") {
        Fluttertoast.showToast(
            msg: "Please fill all the details!", gravity: ToastGravity.BOTTOM);
      } else if (password != cpassword) {
        Fluttertoast.showToast(
            msg: "Password not matched!", gravity: ToastGravity.BOTTOM);
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          if (userCredential.user != null) {
            //user crete
            Navigator.popUntil(context, (route) => route.isFirst);

            Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: ((context) => BottomBar())));
            Fluttertoast.showToast(
                msg: "Your account created", gravity: ToastGravity.BOTTOM);

            //user details saved
            Map<String, dynamic> addData = {
              "user_name": name,
              "user_email": email,
            };
            FirebaseFirestore.instance.collection("USER").add(addData);
          }
        } on FirebaseAuthException catch (ex) {
          Fluttertoast.showToast(
              msg: ex.code.toString(), gravity: ToastGravity.BOTTOM);
        }
      }
    }

    var screenHeight = MediaQuery.of(context).size.height;
    // print("height${ screenHeight}");
    // height820.5714285714286
    var screenWidth = MediaQuery.of(context).size.width;
    // print("width${ screenWidth}");
    // width411.42857142857144

    return Scaffold(
      // backgroundColor: bgcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            screenHeight < 480 ? screenWidth / 54.7 : screenHeight / 54.7,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        appLogo,
                        height: screenHeight < 480
                            ? screenWidth / 4.05
                            : screenHeight / 4.05,
                      ),
                      SizedBox(
                        height: screenHeight < 480
                            ? screenWidth / 82.05
                            : screenHeight / 82.05,
                      ),
                      TextField(
                      
                        // style: TextStyle(fontSize: MediaQuery.of(context).size.height/40.62),
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Full name",
                          icon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight < 480
                            ? screenWidth / 82.05
                            : screenHeight / 82.05,
                      ),
                      TextField(
                      
                        // style: TextStyle(fontSize: MediaQuery.of(context).size.height/40.62),
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          icon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight < 480
                            ? screenWidth / 82.05
                            : screenHeight / 82.05,
                      ),
                      TextField(
                 
                        // style: TextStyle(fontSize: MediaQuery.of(context).size.height/40.62),
                        controller: passController,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          icon: const Icon(Icons.password),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight < 480
                            ? screenWidth / 82.05
                            : screenHeight / 82.05,
                      ),
                      TextField(
                 
                        // style: TextStyle(fontSize: MediaQuery.of(context).size.height/40.62),
                        controller: cpassController,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          icon: const Icon(Icons.password),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight < 480
                            ? screenWidth / 27.35
                            : screenHeight / 27.35,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            createAccount();
                            // Navigator.push(
                            //     context,
                            //     CupertinoPageRoute(
                            //         builder: ((context) => const BottomBar())));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(
                              screenHeight < 480
                                  ? screenWidth / 102.56
                                  : screenHeight / 102.56,
                            ),
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                fontSize: screenHeight < 480
                                    ? screenWidth / 41.02
                                    : screenHeight / 41.02,
                                // color: bgcolor,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: screenHeight < 480
                            ? screenWidth / 27.35
                            : screenHeight / 27.35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Do you have already account? ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: screenHeight < 480
                                  ? screenWidth / 54.7
                                  : screenHeight / 54.7,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          const SignInPage())));
                            },
                            child: Text(
                              "SignIn ",
                              style: TextStyle(
                                  fontSize: screenHeight < 480
                                      ? screenWidth / 48.26
                                      : screenHeight / 48.26,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
