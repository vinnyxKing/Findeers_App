import 'package:findeers_app/devices/devices.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreData extends StatelessWidget {
  // final dbase = FirebaseFirestore.instance;
  final DisplayDevices dev;
  StoreData({Key? key, required this.dev}) : super(key: key);
  CollectionReference userReg = FirebaseFirestore.instance.collection('Users');

  Future write() async {
    //WidgetsFlutterBinding.ensureInitialized();
    //await Firebase.initializeApp();
    final SharedPreferences sharedpref = await SharedPreferences.getInstance();
    var useremail = sharedpref.getString('email');
    //print("EMAILLLLLLLLLLLLLLLL ISSSSSSSS :");
    //print(useremail);
    return await userReg.doc(useremail).collection('Bluetooth').add({
      'name': dev.name,
      'mac': dev.address,
      'rssi': dev.val_rssi,
    });
    /*  await dbase.collection("Users").add({
      'name': dev.name,
      'mac': dev.address,
      'rssi': dev.val_rssi,
    }
'name':dev.name,
     'mac':dev.address,
     'rssi':dev.val_rssi,*/
    // );
    //dev.toJson()
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
