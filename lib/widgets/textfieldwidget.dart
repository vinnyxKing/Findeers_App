import 'package:findeers_app/utilities/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textcontroller;
  final String hintText;
  final double borderRadius;
  final int? maxlines;

  const TextFieldWidget(
      {Key? key,
      required this.textcontroller,
      required this.hintText,
      this.borderRadius = 30,
      this.maxlines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      controller: textcontroller,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColours.textHolder,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.white, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.white, width: 1))),
    );
  }
}
