//forgot password section page
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPassPage extends StatefulWidget {
  ForgetPassPage({Key? key}) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  TextEditingController sendemailController = TextEditingController();

  String tost = "";

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // print("height${ screenHeight}");
    // height820.5714285714286
    var screenWidth = MediaQuery.of(context).size.width;
    // print("width${ screenWidth}");
    // width411.42857142857144

    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                autofocus: true,
                //  style: TextStyle(fontSize: MediaQuery.of(context).size.height/40.62),
                controller: sendemailController,
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
              ElevatedButton(
                  onPressed: () async {
                    String sendemail = sendemailController.text.trim();
                    sendemailController.clear();
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: sendemail);
                      setState(() {
                        tost = "Check your email inbox";
                      });
                      Fluttertoast.showToast(
                          msg: "Check your email inbox",
                          gravity: ToastGravity.BOTTOM);
                    } catch (e) {
                      {
                        Fluttertoast.showToast(
                            msg: e.toString(), gravity: ToastGravity.BOTTOM);
                      }
                    }
                  },
                  child: const Text("Send Email")),
              SizedBox(
                height: screenHeight < 480
                    ? screenWidth / 82.05
                    : screenHeight / 82.05,
              ),
              Text(tost),
            ],
          ),
        ),
      )),
    );
  }
}
