// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowIconButton extends StatelessWidget {
  final Widget widget;
  final Function() pressFunc;
  const ShowIconButton({
    Key? key,
    required this.widget,
    required this.pressFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: pressFunc, icon: widget);
  }
}
