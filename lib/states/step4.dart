import 'package:flutter/material.dart';
import 'package:ischool/states/step5.dart';
import 'package:ischool/utility/my_constant.dart';
import 'package:ischool/widgets/show_button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:steps_indicator/steps_indicator.dart';

import '../widgets/show_text.dart';

class Step4 extends StatefulWidget {
  const Step4({Key? key}) : super(key: key);

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
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
                        label: titles[4],
                        textStyle: MyConstant().h2Style(),
                      ),
                    ),
                  ],
                ),
                StepsIndicator(
                  lineLength: 60,
                  selectedStep: 4,
                  nbSteps: 6,
                ),
                newTitle(title: 'กำหนดรหัส PIN'),
                OTPTextField(
                  fieldStyle: FieldStyle.box,
                  length: 6,
                  width: 250,
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
                        builder: (context) => const Step5(),
                      ));
                },
                color: Colors.orange.shade700),
          ],
        ),
      ],
    );
  }
}
