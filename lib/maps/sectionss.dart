import 'package:flutter/material.dart';

import '../devices/connect.dart';

class sections extends StatefulWidget {
  const sections({Key? key}) : super(key: key);

  @override
  State<sections> createState() => _sectionsState();
}

class _sectionsState extends State<sections> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kdefaultpaddin),
    );
  }

  Widget newSection(List<String> sections, int index) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kdefaultpaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
