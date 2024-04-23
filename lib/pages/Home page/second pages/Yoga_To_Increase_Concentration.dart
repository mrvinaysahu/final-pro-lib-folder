import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/customwidget_home.dart';
import 'package:yoga_trainer_app/const/customwidget_sec_page.dart';
import 'package:yoga_trainer_app/pages/Home%20page/second%20pages/audiolist_page.dart';

class YogaToIncreaseConcentration extends StatefulWidget {
  String text;
  var img = "";
  YogaToIncreaseConcentration(this.text, this.img, {super.key});

  @override
  State<YogaToIncreaseConcentration> createState() =>
      _YogaToIncreaseConcentrationState();
}

class _YogaToIncreaseConcentrationState
    extends State<YogaToIncreaseConcentration> {
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
            sizedBox20(),
            sizedBox10(),
            Row(
              children: [
                Expanded(
                    child: audioBoxWidget(
                        "Relaxing Audio",
                        "assets/img/relexing_audio.jpg",
                        context,
                        AudioListPage(
                            "Relaxing Audio", "relaxing_audio_page"))),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: audioBoxWidget(
                        "Nature Audio",
                        "assets/img/nature_audio.jpeg",
                        context,
                        AudioListPage("Nature Audio", "nature_audio_page"))),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                    child: audioBoxWidget(
                        "Sleep Audio",
                        "assets/img/sleep_audio.jpg",
                        context,
                        AudioListPage("Sleep Audio", "sleeping_audio_page"))),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: audioBoxWidget(
                        "Spiritual Audio",
                        "assets/img/spiritual_audio.jpg",
                        context,
                        AudioListPage(
                            "Spiritual Audio", "spiritual_audio_page"))),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
