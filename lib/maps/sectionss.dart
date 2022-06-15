import 'package:flutter/material.dart';
import 'package:layout/connect.dart';

class sections extends StatefulWidget {
  const sections({Key? key}) : super(key: key);

  @override
  State<sections> createState() => _sectionsState();
}

class _sectionsState extends State<sections> {
  List<String> sections = ["Your Devices", "Chats", "chats2"];
  int pickedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kdefaultpaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sections.length,
            itemBuilder: (context, index) => newSection(sections, index)),
      ),
    );
  }

  Widget newSection(List<String> sections, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pickedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kdefaultpaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              sections[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: pickedIndex == index ? ktextcolor : ktextcolor),
            ),
            Container(
              margin: EdgeInsets.only(top: kdefaultpaddin / 4),
              height: 2,
              width: 30,
              color: pickedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
