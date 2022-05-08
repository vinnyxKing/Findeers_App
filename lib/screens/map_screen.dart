import 'dart:ui';
import 'package:findeers_app/utilities/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/location1.jpg"
                )
            )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                      const SizedBox(height: 30,),
                      IconButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>const HomeScreen()));
                      },
                        icon: Icon(Icons.arrow_back,
                          color: AppColours.secondaryColour,),),
                  RichText(
                    text: TextSpan(
                      text: "Findeer",
                      style: TextStyle(
                          color: AppColours.mainColour,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),),
                  ],
                ),
                Column(

                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
