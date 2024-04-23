import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/customwidget_home.dart';

class Blog_Page extends StatefulWidget {
  const Blog_Page({super.key});

  @override
  State<Blog_Page> createState() => _Blog_PageState();
}

class _Blog_PageState extends State<Blog_Page> {
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
              appBar(screenHeight, screenWidth, "Yoga Blog"),
              sizedBox10(),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("blog_page")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: ((context, index) {
                              Map<String, dynamic> blogMap =
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>;

                              return blogList(context,
                                  screenHeight,
                                  screenWidth,
                                  blogMap["blog_name"],
                                  blogMap["blog_description"],
                                  blogMap["image_url"]);
                            }));
                      } else {
                        return const Center(
                            child: Text("Data is not available"));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
