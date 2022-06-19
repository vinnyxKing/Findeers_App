import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findeers_app/devices/blueT.dart';
import 'package:findeers_app/devices/connect.dart';
import 'package:findeers_app/devices/devices.dart';
import 'package:findeers_app/maps/sectionss.dart';
import 'package:findeers_app/utilities/auth_method.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'info.dart';

var useremail;

class HomeScreen extends StatefulWidget {
  //const Body({Key? key}) : super(key: key);
  //List<DisplayDevices> devic2 = [];
  //HomeScreen(this.devic2);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String upname = '';
  String upmac = '';
  String uprssi = '';
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  List<DisplayDevices> devr = [];
  AuthUser check = AuthUser();

  Future getemail() async {
    final SharedPreferences sharedpref = await SharedPreferences.getInstance();
    useremail = sharedpref.getString('email').toString();
  }

  @override
  initState() {
    super.initState();

    getemail();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/log4.jpg"),
    fit: BoxFit.cover)),
    child: Scaffold(
backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Findeers",
            textDirection: TextDirection.ltr,
            style: GoogleFonts.lobster(fontSize: 40,
            fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
        ),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.remove('email');
              AuthUser service = AuthUser();
              service.logOutUser(context);
            },
            icon: Icon(Icons.logout),
            color: Colors.black,
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kdefaultpaddin),

          ),
          sections(),

          //  storeddevices(),
          Expanded(
              child: StreamBuilder(
                //Fetching data from the documentId specified of the student
                stream: users.doc(useremail).collection('Bluetooth').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  //Error Handling conditions
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }

                  //Data is output to the user
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot users = snapshot.data!.docs[index];
                        String id = snapshot.data!.docs[index].id.toString();
                        upmac = users['mac'];
                        upname = users['name'];
                        uprssi = users['rssi'];
                        // String ch = users['uid'];

                        devr.add(DisplayDevices(
                            address: upmac, name: upname, val_rssi: uprssi));

                        return Card(
                          child: ListTile(
                            leading: Text(users['rssi']),
                            subtitle: Text(users['mac']),
                            title: Text(users['name']),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DeviceInfo(
                                        devices: devr[index],
                                        delid: id,
                                      )));
                            }
                            // Navigator.of(context).push(MaterialPageRoute(
                            // builder: (context) => HomeScreen(devr)));
                            ,
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ScanBlue()));
        },
        child: Icon(Icons.search),
      )),
    );
  }
}