import 'package:findeers_app/screens/homescreen.dart';
import 'package:findeers_app/widgets/button_widget.dart';
import 'package:findeers_app/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';
import '../utilities/app_colors.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController emailController,
      userNameController,
      pswrd1Controller,
      pswrd2Controller,
      birthdayController;
  late DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    userNameController = TextEditingController();
    pswrd1Controller = TextEditingController();
    pswrd2Controller = TextEditingController();
    birthdayController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/bg1.jpg"))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(children: [
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
                              text: "\nSIGN UP HERE",
                              style: TextStyle(
                                color: AppColours.mainColour,
                                fontSize: 15,
                              ),
                            ),
                          ]),
                    ),
                  ]),
                ],
              ),
              Column(
                children: [
                  TextFieldWidget(
                      textcontroller: emailController,
                      hintText: "Email",
                      borderRadius: 30),
                  TextFieldWidget(
                      textcontroller: userNameController,
                      hintText: "Username",
                      borderRadius: 30),
                  TextFieldWidget(
                      textcontroller: pswrd1Controller,
                      hintText: "Password",
                      borderRadius: 30),
                  TextFieldWidget(
                      textcontroller: pswrd2Controller,
                      hintText: "Confrim password",
                      borderRadius: 30),
                  TextFieldWidget(
                      textcontroller: birthdayController,
                      hintText: "dd/mm/yyyy",
                      borderRadius: 30)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              TextButton(
                  onPressed: () {
                    addToDb();
                  },
                  child: const ButtonWidget(
                      backgroundcolor: AppColours.mainColour,
                      text: "Create",
                      textColor: Colors.white)),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addToDb() {
    String name = userNameController.text;
    String email = emailController.text;
    String password1 = pswrd1Controller.text;
    String password2 = pswrd2Controller.text;

    Map<String, String> users = {
      'name': name,
      'email': email,
      'password1': password1,
      'password2': password2,
    };

    _ref.push().set(users);
  }
}
