import 'package:flutter/material.dart';
import 'package:ischool/states/step4.dart';
import 'package:ischool/utility/my_constant.dart';
import 'package:ischool/widgets/show_button.dart';
import 'package:ischool/widgets/show_form.dart';
import 'package:steps_indicator/steps_indicator.dart';

import '../widgets/show_text.dart';

class Step3 extends StatefulWidget {
  const Step3({Key? key}) : super(key: key);

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  var titles = MyConstant.headerCreateAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            newBottom(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: ShowText(
                        label: titles[3],
                        textStyle: MyConstant().h2Style(),
                      ),
                    ),
                  ],
                ),
                StepsIndicator(
                  lineLength: 60,
                  selectedStep: 3,
                  nbSteps: 6,
                ),
                newTitle(title: 'กำหนดชื่อผู้ใช้งาน'),
                ShowForm(
                  hind: 'กำหนดชื่อผู้ใช้งาน',
                  changeFunc: (String string) {},
                ),
                newTitle(title: 'กำหนดรหัสผ่าน'),
                ShowForm(
                  hind: 'กำหนดรหัสผ่านน',
                  changeFunc: (String string) {},
                ),
                Container(width: 300,
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: ShowText(label: 'คำแนะนำสำหรับการตั้งรหัสผ่าน',textStyle: MyConstant().h4Style(),)),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              ShowText(
                                  label: '1.รหัสควรมีความยาวอย่างน้อย 8 ตัวอักษร',textStyle: MyConstant().h4Style(),),
                                  ShowText(
                                  label: '2.รหัสควรมีทั้งตัวเลขและตัวอักษร',textStyle: MyConstant().h4Style(),),
                                  ShowText(
                                  label: '3.หลีกเลี่ยงการใช้วันเดือนปีเกิดตัวเอง',textStyle: MyConstant().h4Style(),),
                            ],
                          )),
                    ],
                  ),
                ),
                newTitle(title: 'ยืนยันรหัสผ่านอีกครั้ง'),
                ShowForm(
                  hind: 'ยืนยันรหัสผ่านอีกครั้ง',
                  changeFunc: (String string) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row newTitle({required String title}) {
    return Row(
      children: [
        const SizedBox(
          width: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShowText(
            label: title,
            textStyle: MyConstant().h2Style(),
          ),
        ),
      ],
    );
  }

  Widget newBottom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ShowButton(
                label: 'ย้อนกลับ',
                pressfunc: () {
                  Navigator.pop(context);
                }),
            ShowButton(
                label: 'ตกลง',
                pressfunc: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Step4(),
                      ));
                },
                color: Colors.orange.shade700),
          ],
        ),
      ],
    );
  }
}
