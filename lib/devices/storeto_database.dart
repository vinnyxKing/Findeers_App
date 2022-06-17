import 'package:findeers_app/devices/devices.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:core';

class StoreData extends StatelessWidget {
  // final dbase = FirebaseFirestore.instance;
  final DisplayDevices dev;
  StoreData({Key? key, required this.dev}) : super(key: key);
  var useremail;
  CollectionReference userReg = FirebaseFirestore.instance.collection('Users');

  Future write() async {
    //WidgetsFlutterBinding.ensureInitialized();
    //await Firebase.initializeApp();
    final SharedPreferences sharedpref = await SharedPreferences.getInstance();
    useremail = sharedpref.getString('email');
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

  // final SharedPreferences sharedpref = await SharedPreferences.getInstance();
  //var useremail = sharedpref.getString('email');
  Stream<List<DisplayDevices>> readuserdata() => userReg
      .doc(useremail)
      .collection('Bluetooth')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => DisplayDevices.fromJson(doc.data()))
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("yessss")),
        body: StreamBuilder<List<DisplayDevices>>(
            stream: readuserdata(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("i dont know! ${snapshot}");
              }
              if (snapshot.hasData) {
                final users = snapshot.data!;

                return ListView(children: users.map(buildUser).toList());
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Widget buildUser(DisplayDevices dev) => ListTile(
        leading: Text(dev.name),
        subtitle: Text(dev.address),
        title: Text(dev.val_rssi),
        trailing: Text("hello"),
      );
}
