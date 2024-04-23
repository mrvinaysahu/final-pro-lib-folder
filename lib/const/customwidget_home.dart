import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_trainer_app/const/colors.dart';
import 'package:yoga_trainer_app/const/variables.dart';
import 'package:yoga_trainer_app/pages/Blog%20page/blog_details_page.dart';

Widget homeContainer(screenWidth, text, img, pagename, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, CupertinoPageRoute(builder: ((context) => pagename)));
    },
    child: Container(
      width: screenWidth,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
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
    ),
  );
}

//text size
Widget textSize18(string) {
  return Text(
    string,
    style: TextStyle(fontSize: 18, color: maincolor),
    textAlign: TextAlign.start,
  );
}

Widget boldTextSize18(string) {
  return Text(
    string,
    style:
        TextStyle(fontSize: 18, color: maincolor, fontWeight: FontWeight.bold),
  );
}

//size box
Widget sizedBox10() {
  return const SizedBox(
    height: 10,
  );
}

Widget sizedBox20() {
  return const SizedBox(
    height: 20,
  );
}

//App Bar
Widget appBar(screenHeight, screenWidth, title) {
  return Row(
    children: [
      Image.asset(
        appLogo,
        height: screenHeight < 480 ? screenWidth / 19.05 : screenHeight / 19.05,
      ),
      boldTextSize18(title),
    ],
  );
}

//Blog list
Widget blogList(context, screenHeight, screenWidth, blogname, blogdesc, image) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: ((context) => Blog_details_Page(
                    blogname, blogdesc, image, screenHeight, screenWidth))));
      },
      child: Container(
        // height: screenHeight < 480 ? screenWidth / 5.20 : screenHeight / 5.20,
        width: screenWidth,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: maincolor),
          borderRadius: BorderRadius.circular(10),
          color: secondcolor,
        ),
        child: Row(
          children: [
            Container(
              width:
                  screenHeight < 480 ? screenWidth / 7.25 : screenHeight / 7.25,
              // width:80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              height:
                  screenHeight < 480 ? screenWidth / 7.20 : screenHeight / 7.20,
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
                      ? screenWidth / 120.56
                      : screenHeight / 120.56),
                  child: Column(
                    children: [
                      //BOOK NAME
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          blogname,
                          style: TextStyle(
                              color: maincolor,
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight < 480
                                  ? screenWidth / 42.7
                                  : screenHeight / 42.7),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      SizedBox(
                        height: screenHeight / 164.1,
                      ),
                      Text(
                        blogdesc,
                        style: TextStyle(
                            fontSize: screenHeight < 480
                                ? screenWidth / 60
                                : screenHeight / 60),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
