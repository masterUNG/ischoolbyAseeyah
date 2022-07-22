import 'package:flutter/material.dart';
import 'package:ischool/states/step1.dart';
import 'package:ischool/utility/my_constant.dart';
import 'package:ischool/widgets/show_button.dart';
import 'package:steps_indicator/steps_indicator.dart';

import '../widgets/show_text.dart';

class Step0 extends StatefulWidget {
  const Step0({Key? key}) : super(key: key);

  @override
  State<Step0> createState() => _Step0State();
}

class _Step0State extends State<Step0> {
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
                        label: titles[0],
                        textStyle: MyConstant().h2Style(),
                      ),
                    ),
                  ],
                ),
                StepsIndicator(
                  lineLength: 60,
                  selectedStep: 0,
                  nbSteps: 6,
                ),
                newStep0()
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
            ShowButton(label: 'ย้อนกลับ', pressfunc: () {}),
            ShowButton(
                label: 'ตกลง',
                pressfunc: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Step1(),
                      ));
                },
                color: Colors.orange.shade700),
          ],
        ),
      ],
    );
  }

  Widget newStep0() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              ShowText(label: MyConstant.demoText),
              const SizedBox(height: 16),
              ShowText(label: MyConstant.demoText),
              const SizedBox(height: 16),
              ShowText(label: MyConstant.demoText),
              const SizedBox(height: 16),
            ],
          );
        }),
      );


}
