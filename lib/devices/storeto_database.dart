import 'package:findeers_app/devices/devices.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

var useremail;

class StoreData extends StatelessWidget {
  // final dbase = FirebaseFirestore.instance;
  //final DisplayDevices dev;
  //StoreData({Key? key, required this.dev}) : super(key: key);
  CollectionReference userReg = FirebaseFirestore.instance.collection('Users');

  Future write(DisplayDevices dev) async {
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
      'uid': useremail,
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

  Future<List<DisplayDevices>> read() async {
    final SharedPreferences sharedpref = await SharedPreferences.getInstance();
    useremail = sharedpref.getString('email');
    print("READDDDDDDDDDDDDDDDDDDDDDDDD ISSSSSSSS :");
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
        print("#####**********************************************#####");
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
