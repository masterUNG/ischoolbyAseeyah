// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowForm extends StatelessWidget {
  final String hind;
  final int? digit;
  final TextInputType? textInputType;
  final Function(String) changeFunc;
  const ShowForm({
    Key? key,
    required this.hind,
    this.digit,
    this.textInputType,
    required this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextFormField(onChanged: changeFunc,
        keyboardType: textInputType ?? TextInputType.text,
        maxLength: digit,
        decoration: InputDecoration(
          hintText: hind,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
