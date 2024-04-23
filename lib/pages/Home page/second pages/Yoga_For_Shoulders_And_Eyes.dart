import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/customwidget_sec_page.dart';

class YogaForShouldersAndEyes extends StatefulWidget {
  String text;
  var img = "";
  YogaForShouldersAndEyes(this.text, this.img, {super.key});

  @override
  State<YogaForShouldersAndEyes> createState() =>
      _YogaForShouldersAndEyesState();
}

class _YogaForShouldersAndEyesState extends State<YogaForShouldersAndEyes> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            secondContainer(screenWidth, widget.text, widget.img),
          ],
        ),
      ),
    ));
  }
}
