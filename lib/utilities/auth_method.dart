import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findeers_app/screens/homescreen.dart';
import 'package:findeers_app/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/index_screen.dart';


class AuthUser{

  final auth = FirebaseAuth.instance;
  
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  
  void loginUser(context)async{

    try{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.signInWithEmailAndPassword(email: email.text, password: password.text).then((value){
        print("Loged in successfully");

        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => IndexScreen()),
                (route) => false);
      });
    }catch(err){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Error Occured"),
          content: Text(err.toString()),
        );
      });
    }
  }
  void RegisterUser(context) async{
    try{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value){
        print("User is Registered");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignIn()));
      });
      
    }catch(err){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Error Occured"),
          content: Text(err.toString()),
        );
      });
    }
  }

  void logOutUser(context)async{
    auth.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
        (context) =>HomeScreen()), (route) => false);
  }
}