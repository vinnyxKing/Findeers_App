import 'package:findeers_app/utilities/app_colors.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/home1.jpg"))),
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
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColours.secondaryColour,
                    ),
                  ),
                  RichText(
                      text: const TextSpan(
                          text: "Findeer",
                          style: TextStyle(
                              color: AppColours.mainColour,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                          text: "\n\n Devices",
                          style: TextStyle(
                            color: AppColours.mainColour,
                            fontSize: 15,
                          ),
                        ),
                      ])),
                ],
              )
            ],
          ))),
    );
  }
}
