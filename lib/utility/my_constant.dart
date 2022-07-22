import 'package:flutter/material.dart';

class MyConstant {
  static String urlDemoAvatar = 'https://randomuser.me/api/portraits/women/41.jpg';

  static List<String> titles = [
    'I-School',
    'ติดต่อครูที่ปรึกษา',
    'I-School',
  ];
  static List<String> subTitles = [
    'สะดวก ง่าย ครบทุกการใช้งาน',
    'เชื่อมโยงผู้ปกครองกับครูที่ปรึกษาไว้ในแอปเดียว',
    'สะดวกทุกที่ ทุกเวลา',
  ];
  static List<String> sub2Titles = [
    'ทั้งตรวจสอบการมาเรียน การบ้าน ผลการเรียน เป็นต้น',
    'แจ้งลา แจ้งรับนักเรียน หรือพูดคุย สื่อสารกับคุณครู',
    'รองรับทุกการใช้งาน',
  ];

  static List<String> headerCreateAccount = [
    'เงื่อนไขและข้อตกลง',
    'ข้อมูลการลงทะเบียน',
    'กรอกรหัส OTP',
    'กำหนดชื่อและรหัสผ่าน',
    'กำหนดรหัส PIN',
    'ยื่นยันรหัสอีกครั้ง',
  ];

  static Color primary = const Color.fromARGB(255, 243, 163, 33);
  static Color primaryDark = const Color.fromARGB(255, 237, 98, 5);
  static Color dark = const Color.fromARGB(255, 0, 67, 121);
  static Color light = const Color.fromARGB(255, 138, 196, 243);

  static String demoText =
      'เนื้อหาจำลองแบบเรียบๆ ที่ใช้กันในธุรกิจงานพิมพ์หรืองานเรียงพิมพ์ มันได้กลายมาเป็นเนื้อหาจำลองมาตรฐานของธุรกิจดังกล่าวมาตั้งแต่ศตวรรษที่ 16 เมื่อเครื่องพิมพ์โนเนมเครื่องหนึ่งนำรางตัวพิมพ์มาสลับสับตำแหน่งตัวอักษรเพื่อทำหนังสือตัวอย่าง Lorem Ipsum อยู่ยงคงกระพันมาไม่ใช่แค่เพียงห้าศตวรรษ';

  static String urlAPIreadAllSchool =
      'https://ischoolme.com/ischoolme/apijson/show_school_center.php';

  BoxDecoration orangeBox() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[MyConstant.primary, MyConstant.primaryDark],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
    );
  }

  TextStyle h1Style() => TextStyle(
        fontSize: 36,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h4Style() => TextStyle(
        fontSize: 10,
        color: dark,
        fontWeight: FontWeight.normal,
      );
}
