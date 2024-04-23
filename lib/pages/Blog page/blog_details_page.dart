import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/colors.dart';
import 'package:yoga_trainer_app/const/customwidget_home.dart';

class Blog_details_Page extends StatefulWidget {
  var name;
  var description;
  var image;
  var screenheight;
  var screenwidth;
  Blog_details_Page(this.name, this.description, this.image, this.screenheight,
      this.screenwidth,
      {super.key});

  @override
  State<Blog_details_Page> createState() => _Blog_details_PageState();
}

class _Blog_details_PageState extends State<Blog_details_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.network(
                widget.image,
              ),
              sizedBox10(),
              Align(
                  alignment: Alignment.topLeft,
                  child: boldTextSize18(widget.name)),
              sizedBox10(),
              Text(
                widget.description,
                style: TextStyle(fontSize: 15),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
