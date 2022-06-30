import 'package:findeers_app/devices/devices.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

var useremail;

class StoreData extends StatelessWidget {
  CollectionReference userReg = FirebaseFirestore.instance.collection('Users');

  Future write(DisplayDevices dev) async {
    final SharedPreferences sharedpref = await SharedPreferences.getInstance();
    var useremail = sharedpref.getString('email');

    return await userReg.doc(useremail).collection('Bluetooth').add({
      'name': dev.name,
      'mac': dev.address,
      'rssi': dev.val_rssi,
      'uid': useremail,
    });
  }

  Future<List<DisplayDevices>> read() async {
    final SharedPreferences sharedpref = await SharedPreferences.getInstance();
    useremail = sharedpref.getString('email');
    List<DisplayDevices> devse = [];
    FirebaseFirestore.instance
        .collection('Users')
        .doc(useremail)
        .collection('Bluetooth')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        devse.add(DisplayDevices(
            val_rssi: doc["rssi"], name: doc["name"], address: doc["mac"]));
        print(doc["mac"]);
      });
    });
    return devse;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
