import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/customwidget_home.dart';
import 'package:yoga_trainer_app/const/variables.dart';
import 'package:yoga_trainer_app/pages/Home%20page/second%20pages/10_Minutes_Yoga.dart';
import 'package:yoga_trainer_app/pages/Home%20page/second%20pages/Yoga_To_Increase_Concentration.dart';
import 'package:yoga_trainer_app/pages/Home%20page/second%20pages/all_in_one.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(screenHeight, screenWidth,appName),
                sizedBox20(),
                textSize18("Yoga For All"),
                sizedBox10(),
                homeContainer(
                    screenWidth,
                    "All In One Yoga",
                    "assets/img/all_in_one_yoga.jpg",
                    AllInOne(
                        "All In One Yoga", "assets/img/all_in_one_yoga.jpg"),
                    context),
                sizedBox20(),
                textSize18("Yoga For Students"),
                sizedBox10(),
                homeContainer(
                    screenWidth,
                    "10 Minutes Yoga",
                    "assets/img/10_Minutes_Yoga.jpg",
                    MinutesYoga(
                      "10 Minutes Yoga",
                      "assets/img/10_Minutes_Yoga.jpg",
                    ),
                    context),

                sizedBox10(),
                homeContainer(
                    screenWidth,
                    "Yoga To Increase Concentration ",
                    "assets/img/Yoga_To_Increase_Concentration.jpg",
                    YogaToIncreaseConcentration(
                      "Yoga To Increase Concentration ",
                      "assets/img/Yoga_To_Increase_Concentration.jpg",
                    ),
                    context),
                sizedBox10(),
                // homeContainer(
                //     screenWidth,
                //     "Yoga For Shoulders And Eyes",
                //     "assets/img/Yoga_For_Shoulders_And_Eyes.jpg",
                //     YogaForShouldersAndEyes(
                //       "Yoga For Shoulders And Eyes",
                //       "assets/img/Yoga_For_Shoulders_And_Eyes.jpg",
                //     ),
                //     context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
