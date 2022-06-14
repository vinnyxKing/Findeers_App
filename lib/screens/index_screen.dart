import 'package:findeers_app/utilities/app_colors.dart';
import 'package:findeers_app/utilities/auth_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Findeer",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        backgroundColor: AppColours.mainColour,
        elevation: 25,
        actions: [
          IconButton(
              onPressed: () {
               AuthUser authUser = AuthUser();
               authUser.logOutUser(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/log3-modified.jpg"))),
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

                ],
              )
            ],
          ))),
    );
  }
}
