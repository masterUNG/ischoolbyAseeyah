// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowButton extends StatelessWidget {
  final String label;
  final Color? color;
  final Function() pressfunc;
  const ShowButton({
    Key? key,
    required this.label,
    this.color,
    required this.pressfunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: color ?? Colors.grey.shade700),
      onPressed: pressfunc,
      child: Text(label),
    );
  }
}
