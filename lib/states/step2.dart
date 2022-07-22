import 'package:flutter/material.dart';
import 'package:ischool/states/step3.dart';
import 'package:ischool/utility/my_constant.dart';
import 'package:ischool/widgets/show_button.dart';
import 'package:ischool/widgets/show_form.dart';
import 'package:steps_indicator/steps_indicator.dart';

import '../widgets/show_text.dart';

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
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
                        label: titles[2],
                        textStyle: MyConstant().h2Style(),
                      ),
                    ),
                  ],
                ),
                StepsIndicator(
                  lineLength: 60,
                  selectedStep: 2,
                  nbSteps: 6,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ShowText(
                            label: 'กรอกรหัส OTP ไปยังหมายเลข',
                            textStyle: MyConstant().h2Style(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ShowText(
                            label: 'xxx-xxx-x123',
                            textStyle: MyConstant().h2Style(),
                          ),
                        ),
                      ],
                    ),
                    ShowForm(
                      hind: 'กรอกรหัส OTP 6 หลัก',
                      changeFunc: (String string) {},
                      textInputType: TextInputType.number,
                      digit: 6,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
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
                        builder: (context) => const Step3(),
                      ));
                },
                color: Colors.orange.shade700),
          ],
        ),
      ],
    );
  }
}
