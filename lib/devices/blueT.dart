import 'package:findeers_app/devices/storeto_database.dart';
import 'package:findeers_app/utilities/auth_method.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../maps/home_screen.dart';
import 'devices.dart';

//import 'main.dart';
//import 'storedDevice.dart';

class ScanBlue extends StatelessWidget {
  final title = 'avaliable devices';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text(title),
      // ),
      body: Scanpage(title: title),
    );
  }
}

class Scanpage extends StatefulWidget {
  Scanpage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ScanpageState createState() => _ScanpageState();
}

class _ScanpageState extends State<Scanpage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> scanResultList = [];
  //List<DisplayDevices> dev
  List<DisplayDevices> stored_device = [];
  List<DisplayDevices> stored_device3 = [];

  bool _isScanning = false;

  @override
  initState() {
    super.initState();

    initBle();
    scan();
  }

  void initBle() {
    flutterBlue.isScanning.listen((isScanning) {
      _isScanning = isScanning;

      setState(() {});
    });
  }

  scan() async {
    if (!_isScanning) {
      scanResultList.clear();

      flutterBlue.startScan(timeout: Duration(seconds: 4));

      flutterBlue.scanResults.listen((results) {
        scanResultList = results;

        setState(() {});
      });
    } else {
      flutterBlue.stopScan();
    }
  }

  Widget deviceSignal(ScanResult r) {
    return Text(r.rssi.toString());
  }

  Widget deviceState(ScanResult r) {
    if (r.device.state.toString() == true) {
      return Text("true");
    } else
      return Text("false");
  }

  Widget deviceMacAddress(ScanResult r) {
    return Text(r.device.id.id);
  }

  Widget deviceName(ScanResult r) {
    String name = '';

    if (r.device.name.isNotEmpty) {
      name = r.device.name;
    } else if (r.advertisementData.localName.isNotEmpty) {
      name = r.advertisementData.localName;
    } else {
      name = 'N/A';
    }
    return Text(name);
  }

  /* BLE 아이콘 위젯 */
  Widget leading(ScanResult r) {
    return CircleAvatar(
      child: Icon(
        Icons.bluetooth,
        color: Colors.white,
      ),
      backgroundColor: Colors.cyan,
    );
  }

  void onTap(ScanResult r) async {
    r.device.connect();

    DisplayDevices stored_device2 = DisplayDevices(
        name: r.device.name,
        address: r.device.id.toString(),
        val_rssi: r.rssi.toString());
    StoreData reciev = StoreData();

    reciev.write(stored_device2);
    print(
        "222222222TTTTTTTTTTTTTTTTTTTTTTTTTTT*********************************");
    stored_device3 = await reciev.read();
    // reciev.getDocid();

    //Navigator.of(context).pushReplacement(MaterialPageRoute(
    //  builder: ((context) => StoreData(
    //         dev: stored_device2,
    //   ))));
    print(
        "3333333TTTTTTTTTTTTTTTTTTTTTTTTTTT*********************************");
    stored_device3.forEach((element) {
      print("NOTTTTTTTTTTTTTTTTTTTTTTTTTTTT*********************************");
      stored_device.add(DisplayDevices(
          address: element.address.toString(),
          name: element.name,
          val_rssi: element.val_rssi.toString()));
    });
    print(
        "3333333TTTTTTTTTTTTTTTTTTTTTTTTTTT*********************************");

    /* stored_device.add(DisplayDevices(
        address: r.device.id.id.toString(),
        name: r.device.name,
        val_rssi: r.rssi.toString()));*/

    AuthUser authen = AuthUser();
    String email = authen.auth.currentUser!.email.toString();
    authen.loginUser(email);

    //HomeScreen(stored_device3).createState().initState();

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));

    /*  setState(() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HomeScreen(stored_device3)));
    });
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen(
              stored_device3)), // this mainpage is your page to refresh
      (Route<dynamic> route) => false,
    );*/
  }

  Widget listItem(ScanResult r) {
    return ListTile(
      onTap: () => onTap(r),
      leading: leading(r),
      title: deviceName(r),
      subtitle: deviceMacAddress(r),
      trailing: deviceSignal(r),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: scanResultList.length,
          itemBuilder: (context, index) {
            return listItem(scanResultList[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
    );
  }
}

class showDev extends StatelessWidget {
  List<DisplayDevices> stored = [];

  showDev(this.stored);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Screen')),
      body: stored.isEmpty
          ? Center(
              child: Text('no device'),
            )
          : ListView.builder(
              itemCount: stored.length,
              itemBuilder: (c, i) {
                print("device is");
                print(stored[i].address);
                return ListTile(
                  leading: Icon(Icons.bluetooth),
                  title: Text(stored[i].name),
                  subtitle: Text(stored[i].address),
                  trailing: Text(stored[i].val_rssi),
                  onTap: () {},
                );
              },
            ),
    );
  }

  AuthUser email = AuthUser();
}
