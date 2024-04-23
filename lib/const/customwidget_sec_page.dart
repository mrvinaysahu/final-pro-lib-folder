import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/audio_player.dart';
import 'package:yoga_trainer_app/const/colors.dart';
import 'package:yoga_trainer_app/const/customwidget_home.dart';
import 'package:yoga_trainer_app/const/variables.dart';

Widget secondContainer(screenWidth, text, img) {
  return Container(
    width: screenWidth,
    height: 170,
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    ),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 1),
        ),
      ],
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: AssetImage(img),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget yogaVideoList(
    screenWidth, screenHeight, context, videoname, videodes, pagename) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: ((context) => pagename)));
      },
      child: Container(
        height: 100,
        width: screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondcolor,
        ),
        child: Row(
          children: [
            Container(
              width:
                  screenHeight < 480 ? screenWidth / 8.25 : screenHeight / 8.25,
              // width:80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(appLogo),
                    fit: BoxFit.fill,
                  ),
                  // color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              height:
                  screenHeight < 480 ? screenWidth / 8.20 : screenHeight / 8.20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: secondcolor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                height: screenHeight < 480
                    ? screenWidth / 8.20
                    : screenHeight / 8.20,
                child: Padding(
                  padding: EdgeInsets.all(screenHeight < 480
                      ? screenWidth / 102.56
                      : screenHeight / 102.56),
                  child: Column(
                    children: [
                      //BOOK NAME
                      Text(
                        videoname,
                        style: TextStyle(
                            color: maincolor,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight < 480
                                ? screenWidth / 42.7
                                : screenHeight / 42.7),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(
                        height: screenHeight / 164.1,
                      ),
                      Text(
                        videodes,
                        style: TextStyle(
                            fontSize: screenHeight < 480
                                ? screenWidth / 60
                                : screenHeight / 60),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              // flex: 3,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget audioBoxWidget(text, img, context, pagename) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, CupertinoPageRoute(builder: ((context) => pagename)));
    },
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),
      ),
      // width: screenWidth / 2.2,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

// audio list widget
Widget customAudiolist(
  context,
  screenWidth,
  screenHeight,
  audioname,
  audiofile,
) {
  return Column(
    // mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // textSize18(pagetitle),
      sizedBox10(),
      InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     CupertinoPageRoute(
          //         builder: ((context) {})));
        },
        child: Container(
          height: 70,
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondcolor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 9,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenHeight < 480
                      ? screenWidth / 18.25
                      : screenHeight / 18.25,
                  // width:80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/music_icon.png"),
                        fit: BoxFit.cover,
                      ),
                      // color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  height: screenHeight < 480
                      ? screenWidth / 8.20
                      : screenHeight / 8.20,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: secondcolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight < 480
                      ? screenWidth / 8.20
                      : screenHeight / 8.20,
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight < 480
                        ? screenWidth / 102.56
                        : screenHeight / 102.56),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //BOOK NAME
                        Text(
                          audioname,
                          style: TextStyle(
                              color: maincolor,
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight < 480
                                  ? screenWidth / 52.7
                                  : screenHeight / 52.7),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(
                          height: screenHeight / 164.1,
                        ),
                      ],
                    ),
                  ),
                ),
                // flex: 3,
              ),
            ],
          ),
        ),
      )
    ],
  );
}
