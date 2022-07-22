import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ischool/states/introduct.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOveride();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home: Introduct(),
    );
  }
}

class MyHttpOveride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert,String host,int port) => true;
  }
}
