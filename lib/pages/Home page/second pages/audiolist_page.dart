import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/colors.dart';
import 'package:yoga_trainer_app/const/customwidget_sec_page.dart';

class AudioListPage extends StatefulWidget {
  var title = "";
  var collection = "";

  AudioListPage(this.title, this.collection, {super.key});

  @override
  State<AudioListPage> createState() => _AudioListPageState();
}

class _AudioListPageState extends State<AudioListPage> {
  @override
  Widget build(BuildContext context) {
    var a = widget.collection;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: maincolor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection(a)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            if (snapshot.hasData && snapshot.data != null) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> audioMap =
                                        snapshot.data!.docs[index].data()
                                            as Map<String, dynamic>;
                                    String audio =
                                        audioMap["audio_url"].toString();
                                    return customAudiolist(
                                        context,
                                        screenWidth,
                                        screenHeight,
                                        audioMap["audio_name"],
                                        audio);
                                  });
                            } else {
                              return const Center(
                                  child: Text("Data is not available"));
                            }
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }))
              ],
            )),
      ),
    );
  }
}
