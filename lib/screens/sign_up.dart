import 'dart:ui';
import 'package:findeers_app/screens/sign_in.dart';
import 'package:findeers_app/utilities/app_colors.dart';
import 'package:findeers_app/utilities/auth_method.dart';
import 'package:findeers_app/widgets/button_widget.dart';
import 'package:findeers_app/widgets/textfieldwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'index_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthUser authUser = AuthUser();

  TextEditingController fNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //TextEditingController pass2Controller = TextEditingController();
  TextEditingController genderController = TextEditingController();

  String gender = "male";

  @override
  void dispose() {
    super.dispose();
    fNameController.dispose();
    emailController.dispose();
    lNameController.dispose();
    passwordController.dispose();
    //pass2Controller.dispose();
    genderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/log1-modified.jpg"))),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
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
                              builder: (context) => HomeScreenDis()));
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
                                text: "\nCREATE ACCOUNT",
                                style: TextStyle(
                                  color: AppColours.mainColour,
                                  fontSize: 15,
                                ),
                              ),
                            ]),
                      ),
                    ]),
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height / 14),
                  Column(
                    children: [
                      TextFieldWidget(
                        textEditingController: fNameController,
                        hintText: "Enter First Name",
                        borderRadius: 30,
                      ),
                      SizedBox(height: 10),
                      TextFieldWidget(
                        textEditingController: lNameController,
                        hintText: "Enter Last Name",
                        borderRadius: 30,
                      ),
                      SizedBox(height: 10),
                      TextFieldWidget(
                        textEditingController: authUser.email,
                        hintText: "Enter Email",
                        borderRadius: 30,
                      ),
                      SizedBox(height: 10),
                      TextFieldWidget(
                        textEditingController: authUser.password,
                        hintText: "Enter Password",
                        borderRadius: 30,
                        isPass: true,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    children: [
                      RadioListTile(
                          value: "Male",
                          groupValue: gender,
                          title: Text("Male"),
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                      RadioListTile(
                          value: "Female",
                          groupValue: gender,
                          title: Text("Female"),
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          }),
                      RadioListTile(
                          value: "Others",
                          groupValue: gender,
                          title: Text("Others"),
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          })
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 14),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 70)),
                      onPressed: () {
                        if (authUser.email != "" && authUser.password != "") {
                          authUser.RegisterUser(context);
                        }
                      },
                      child: Text("Sign Up")),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text("Already have an account? Log in"))
                ],
              ),
            )));
  }
}
