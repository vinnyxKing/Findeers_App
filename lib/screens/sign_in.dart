import 'package:findeers_app/utilities/app_colors.dart';
import 'package:findeers_app/widgets/button_widget.dart';
import 'package:findeers_app/widgets/textfieldwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'index_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/signup.png"))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Row(children: [
                      const SizedBox(
                        height: 110,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                        },
                        icon: Icon(Icons.arrow_back,
                            color: AppColours.secondaryColour),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Findeer",
                            style: TextStyle(
                                color: AppColours.mainColour,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: "\nLOG IN HERE",
                                style: TextStyle(
                                  color: AppColours.mainColour,
                                  fontSize: 15,
                                ),
                              ),
                            ]),
                      ),
                    ]),
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height / 6),
                  Column(
                    children: [
                      TextFieldWidget(
                          textcontroller: userNameController,
                          hintText: "Username",
                          borderRadius: 30),
                      SizedBox(height: 10),
                      TextFieldWidget(
                          textcontroller: passwordController,
                          hintText: "Password",
                          borderRadius: 30)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 6),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 100),
                        maximumSize: const Size(300, 100),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const IndexScreen()));
                      },
                      child: ButtonWidget(
                        backgroundcolor: AppColours.mainColour,
                        text: "Enter",
                        textColor: Colors.white,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )));
  }
}
