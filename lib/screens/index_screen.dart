import 'dart:ui';
import 'package:findeers_app/utilities/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Findeer",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        backgroundColor: AppColours.mainColour,
        elevation: 25,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              icon: Icon(Icons.account_box_rounded))
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 50, right: 10),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  height: 110,
                ),
                RichText(
                    text: TextSpan(
                  text: "Devices",
                  style: TextStyle(
                      color: AppColours.mainColour,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ],
            )
          ],
        )),
      ),
    );
  }
}
