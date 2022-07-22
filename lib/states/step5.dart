import 'package:flutter/material.dart';
import 'package:ischool/utility/my_constant.dart';
import 'package:ischool/widgets/show_button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:steps_indicator/steps_indicator.dart';

import '../widgets/show_text.dart';

class Step5 extends StatefulWidget {
  const Step5({Key? key}) : super(key: key);

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
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
                        label: titles[5],
                        textStyle: MyConstant().h2Style(),
                      ),
                    ),
                  ],
                ),
                StepsIndicator(
                  lineLength: 60,
                  selectedStep: 5,
                  nbSteps: 6,
                ),
                 newTitle(title: 'ยืนรหัส PIN อีกครั้ง'),
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
                label: 'ตกลง', pressfunc: () {}, color: Colors.orange.shade700),
          ],
        ),
      ],
    );
  }
}
