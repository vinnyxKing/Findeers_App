import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findeers_app/devices/devices.dart';
import 'package:findeers_app/screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'maps/home_screen.dart';
import 'screens/map_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences sharedpref = await SharedPreferences.getInstance();
  var useremail = sharedpref.getString('email');
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(useremail)
      .collection('Bluetooth')
      .snapshots();
  runApp(MaterialApp(
    home: useremail == null ? HomeScreenDis() : HomeScreen(),
  ));
}
