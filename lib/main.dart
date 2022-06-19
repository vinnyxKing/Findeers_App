import 'package:findeers_app/screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/map_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences sharedpref = await SharedPreferences.getInstance();
  var useremail = sharedpref.getString('email');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: useremail == null ? HomeScreenDis() : MapScreen(),
  ));
}

