// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowCircleImage extends StatelessWidget {
  final String urlImage;
  const ShowCircleImage({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(urlImage),
    );
  }
}
