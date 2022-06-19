import 'dart:ui';
import 'package:findeers_app/screens/sign_in.dart';
import 'package:findeers_app/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilities/app_colors.dart';
import '../widgets/button_widget.dart';

class HomeScreenDis extends StatefulWidget {
  // const HomeScreenDis({Key? key}) : super(key: key);


  @override
  State<HomeScreenDis> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenDis> {

  @override
  Widget build(BuildContext context) {
return Container(
  decoration: const BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/7.jpg"))),

    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 200),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: "Findeer",
                    style: GoogleFonts.fjallaOne(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: AppColours.mainColour,
                    ),
                    children: [
                      TextSpan(
                        text: "\nFind All the Important things",
                        style: GoogleFonts.abrilFatface(
                          color: AppColours.mainColour,
                          fontSize: 20,
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 7),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignIn()));
                },
                child: ButtonWidget(
                    backgroundcolor: AppColours.mainColour,
                    text: "Sign In",
                    textColor: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: ButtonWidget(
                      backgroundcolor: Colors.white,
                      text: "Sign Up Here",
                      textColor: AppColours.smallTextColour))
            ],
          ),
        ),

      ),)
    );
  }
}
