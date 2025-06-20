import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  CustomFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Align(alignment: Alignment.centerLeft, child: Text(labelText, style: TextStyle(fontSize: 12)))),
        Expanded(
          flex:4,
          child: Align(
            alignment: Alignment.center,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 13),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: EdgeInsetsGeometry.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
              ),
              validator: (value) {
                if (value == null) {
                  throw Error();
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
