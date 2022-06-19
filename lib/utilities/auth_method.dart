import 'package:findeers_app/screens/homescreen.dart';
import 'package:findeers_app/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../devices/devices.dart';
import '../devices/storeto_database.dart';
import '../maps/home_screen.dart';
import '../screens/index_screen.dart';
import '../screens/map_screen.dart';

class AuthUser {
  final auth = FirebaseAuth.instance;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<DisplayDevices> device = [];

  void loginUser(context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
      await auth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) async {
        print("Loged in successfully");

        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('email', email.text);
        StoreData reciev = StoreData();

        device = await reciev.read();

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      });
    } catch (err) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error Occured"),
              content: Text(err.toString()),
            );
          });
    }
  }

  void RegisterUser(context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
      await auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) async {
        StoreData reciev = StoreData();

        device = await reciev.read();

        print("User is Registered");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } catch (err) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error Occured"),
              content: Text(err.toString()),
            );
          });
    }
  }

  void logOutUser(context) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email.text);
    auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreenDis()),
        (route) => false);
  }
}
