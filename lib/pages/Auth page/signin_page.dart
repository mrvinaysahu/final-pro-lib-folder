import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yoga_trainer_app/const/bottom_Navi_bar.dart';
import 'package:yoga_trainer_app/const/colors.dart';
import 'package:yoga_trainer_app/const/variables.dart';
import 'package:yoga_trainer_app/pages/Auth%20page/forgot_pass.dart';
import 'package:yoga_trainer_app/pages/Auth%20page/signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    //login function
    void logIn() async {
      String email = emailController.text.trim();
      String password = passController.text.trim();
      if (email == "" || password == "") {
        Fluttertoast.showToast(
            msg: "Please fill all the details!", gravity: ToastGravity.BOTTOM);
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);

          if (userCredential.user != null) {
            Navigator.popUntil(context, (route) => route.isFirst);

            Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: ((context) => BottomBar())));
            Fluttertoast.showToast(
                msg: "You are loged In", gravity: ToastGravity.BOTTOM);
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

    // var height30 = screenHeight / 27.35;
    // var height10 = screenHeight / 82.05;
    return Scaffold(
      // backgroundColor: bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
                screenHeight < 480 ? screenWidth / 54.7 : screenHeight / 54.7),
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

                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: screenHeight < 480
                              ? screenWidth / 27.35
                              : screenHeight / 27.35,
                          fontWeight: FontWeight.bold,
                          color: maincolor,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight < 480
                            ? screenWidth / 82.05
                            : screenHeight / 82.05,
                      ),

                      SizedBox(
                        height: screenHeight < 480
                            ? screenWidth / 27.35
                            : screenHeight / 27.35,
                      ),
                      TextFormField(
                        //  style: TextStyle(fontSize: MediaQuery.of(context).size.height/40.62),
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

                      TextFormField(
                        obscureText: true,
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
                      Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: ((context) =>
                                            ForgetPassPage())));
                              },
                              child: const Text(
                                "Forgot password?",
                                style: TextStyle(color: Colors.deepPurple),
                              ))),
                      SizedBox(
                        height: screenHeight < 480
                            ? screenWidth / 27.35
                            : screenHeight / 27.35,
                      ),
                      // Text("Forget Password",)
                      ElevatedButton(
                          onPressed: () {
                            logIn();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(screenHeight < 480
                                ? screenWidth / 102.56
                                : screenHeight / 102.56),
                            child: Text(
                              "SignIn",
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
                            "Don't have an account? ",
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
                                          const SignUpPage())));
                            },
                            child: Text(
                              "SignUp ",
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
