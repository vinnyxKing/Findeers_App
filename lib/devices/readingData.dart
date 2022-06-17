import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  final CollectionReference productList =
      FirebaseFirestore.instance.collection("Users");

  Future<List?> getUserList() async {
    // Added List? for better typing
    List itemList = [];

    try {
      await productList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          print(
              "DIVCE ID***********************************************************");
          print(element.data());
          itemList.add(element.data());
        });
      });

      return itemList; // This is missing
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  void initState() {
    //getDocid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
