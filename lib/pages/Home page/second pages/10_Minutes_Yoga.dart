import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/customwidget_home.dart';
import 'package:yoga_trainer_app/const/customwidget_sec_page.dart';
import 'package:yoga_trainer_app/const/video_player.dart';

class MinutesYoga extends StatefulWidget {
  String text;
  var img = "";

  MinutesYoga(this.text, this.img, {super.key});

  @override
  State<MinutesYoga> createState() => _MinutesYogaState();
}

class _MinutesYogaState extends State<MinutesYoga> {
  @override
  Widget build(BuildContext context) {
   
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            secondContainer(screenWidth, widget.text, widget.img),
            sizedBox10(),
          
            sizedBox10(),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("10_minutes_yoga_page")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> videoMap =
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                          return yogaVideoList(
                              screenWidth,
                              screenHeight,
                              context,
                              videoMap["video_name"],
                              videoMap["video_description"],
                              VideoPlayerPage(
                                  videoMap["video_url"],
                                  videoMap["video_name"],
                                  videoMap["video_description"]));
                        },
                      );
                    } else {
                      return const Center(child: Text("Data is not available"));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
