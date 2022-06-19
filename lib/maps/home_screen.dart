import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../devices/body.dart';
import '../devices/connect.dart';
import '../devices/devices.dart';
import '../utilities/auth_method.dart';

class HomeScreen extends StatelessWidget {
  List<DisplayDevices> device = [];
  HomeScreen(this.device, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(31, 37, 33, 71),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove('email');
                AuthUser service = AuthUser();
                service.logOutUser(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Body(device)
    );
  }

  AppBar newMethod() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "svg/back-arrow.svg",
          color: ktextcolor,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(
              "svg/search-line.svg",
              color: ktextcolor,
            ),
            onPressed: () {}),
        SizedBox(width: kdefaultpaddin / 2)
      ],
    );
  }
}
