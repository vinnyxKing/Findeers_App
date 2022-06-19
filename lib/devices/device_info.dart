import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findeers_app/utilities/auth_method.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';

import '../maps/mapUtility.dart';
import '../maps/maps.dart';
import 'connect.dart';
import 'devices.dart';

class Body_detail extends StatelessWidget {
  final DisplayDevices devices;
  String delid;
  Body_detail({Key? key, required this.devices, required this.delid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(
                  top: size.height * 0.12,
                  left: kdefaultpaddin,
                  right: kdefaultpaddin,
                ),
                //height: 500,
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //  borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(24),
                //    topRight: Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    TextButton.icon(
                      icon: Icon(Icons.search),
                      label: Text(
                        "Find device",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Color.fromARGB(255, 190, 180, 180),
                            fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromARGB(255, 25, 26, 25)),
                      onPressed: () {
                        mapsspace space = mapsspace(devices.val_rssi);

                        space.currentlocation();
                      },
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.search),
                      label: Text(
                        "Delete Device",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Color.fromARGB(255, 190, 180, 180),
                            fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromARGB(255, 25, 26, 25)),
                      onPressed: () async {
                        AuthUser user = AuthUser();
                        String email = user.auth.currentUser!.email.toString();
/*await Firestore.instance.runTransaction((Transaction myTransaction) async {
    await myTransaction.delete(snapshot.data.documents[index].reference);
});*/

                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(email)
                            .collection("Bluetooth")
                            .doc(delid)
                            .delete();
                      },
                    ),

                    // ColorsD(),
                  ],
                ),
              ),
              DeviceTitleImageDisplay(devices: devices)
            ]),
          )
        ],
      ),
    );
  }
}

class ColorsD extends StatelessWidget {
  const ColorsD({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
              // child: Text("Find device"),
              //  onTap: ,
              )
        ],
      ),

      height: 24,
      width: 24,
      decoration: BoxDecoration(border: Border.all(color: Color(0xFF356c95))),
      // child: DecoratedBox(decoration: BoxDecoration()),
    );
  }
}

class DeviceTitleImageDisplay extends StatelessWidget {
  const DeviceTitleImageDisplay({
    Key? key,
    required this.devices,
  }) : super(key: key);

  final DisplayDevices devices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kdefaultpaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "\n\nDevice Name",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            devices.name,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kdefaultpaddin),
          Row(
            children: <Widget>[
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "Mac_Address \n"),
                TextSpan(
                    text: "\$${devices.address}\n",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ])),
              SizedBox(width: kdefaultpaddin),
              Expanded(
                  child: Image.asset(
                devices.name,
                fit: BoxFit.fill,
              ))
            ],
          )
        ],
      ),
    );
  }
}
