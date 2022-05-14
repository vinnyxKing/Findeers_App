import 'package:findeers_app/screens/homescreen.dart';
import 'package:findeers_app/widgets/button_widget.dart';
import 'package:findeers_app/widgets/textfieldwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/app_colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController pswrd1Controller = TextEditingController();
    TextEditingController pswrd2Controller = TextEditingController();
    TextEditingController birthdayController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/bg1.jpg"
            )
          )
        ),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(height: 110,),
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
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),
                            children: [
                              TextSpan(
                                text: "\nSIGN UP HERE",
                                style: TextStyle(
                                  color: AppColours.mainColour,
                                  fontSize: 15,
                                ),),
                            ]
                        ),
                      ),
                     ]
                  ),
                ],
              ),
              Column(
                children: [
                  TextFieldWidget(textcontroller: emailController, hintText: "Email", borderRadius: 30),
                  TextFieldWidget(textcontroller: userNameController, hintText: "Username", borderRadius: 30),
                  TextFieldWidget(textcontroller: pswrd1Controller, hintText: "Password", borderRadius: 30),
                  TextFieldWidget(textcontroller: pswrd2Controller, hintText: "Confrim password", borderRadius: 30),
                  TextFieldWidget(textcontroller: birthdayController, hintText: "dd/mm/yyyy", borderRadius: 30)

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/3,),
              TextButton(onPressed: (){},
                  child: ButtonWidget(backgroundcolor: AppColours.mainColour,
                  text: "Create",
                  textColor: Colors.white)),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
