import 'package:findeers_app/utilities/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  final TextEditingController textEditingController;
  final String hintText;
  final double borderRadius;
  final bool isPass;

  const TextFieldWidget({Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.borderRadius,
    this.isPass = false,

    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColours.textHolder,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1
              )
          )
      ),

      obscureText: isPass,
    );
  }
}
