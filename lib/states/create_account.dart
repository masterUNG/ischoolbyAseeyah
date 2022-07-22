import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ischool/model/school_model.dart';
import 'package:ischool/utility/my_constant.dart';
import 'package:ischool/widgets/show_button.dart';
import 'package:ischool/widgets/show_form.dart';
import 'package:ischool/widgets/show_progress.dart';
import 'package:steps_indicator/steps_indicator.dart';
import '../widgets/show_text.dart';
import 'package:http/http.dart' as http;

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  int indexSelect = 0;
  var widgets = <Widget>[];
  var headers = MyConstant.headerCreateAccount;
  var schoolModels = <SchoolModel>[];
  bool load = true;
  var nameSchools = <String>[];
  String? school;

  @override
  void initState() {
    super.initState();
    widgets.add(newStep0());
    widgets.add(newStep1());
    widgets.add(newStep2());
    widgets.add(newStep3());
    widgets.add(newStep4());
    widgets.add(newStep5());

    readAllSchool();
  }

  Future<void> readAllSchool() async {
    String string = await rootBundle.loadString('assets/school.json');
    print('string ==>> $string');

    var result = json.decode(string);
    for (var element in result) {
      SchoolModel schoolModel = SchoolModel.fromMap(element);
      print('nameSchool = ${schoolModel.school_name}');
      schoolModels.add(schoolModel);
      nameSchools.add(schoolModel.school_name);
    }
    load = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: load
            ? const ShowProgress()
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        newCenter(
                            widget: ShowText(
                          label: headers[indexSelect],
                          textStyle: MyConstant().h2Style(),
                        )),
                        StepsIndicator(
                          lineLength: 60,
                          selectedStep: indexSelect,
                          nbSteps: 6,
                        ),
                        newDropdown(),
                        widgets[indexSelect],
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      newBottom(),
                    ],
                  )
                ],
              ),
      ),
    );
  }

  Row newBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ShowButton(
            label: 'ย้อนกลับ',
            pressfunc: () {
              if (indexSelect > 0) {
                setState(() {
                  indexSelect--;
                });
              }
            }),
        ShowButton(
            label: 'ตกลง',
            pressfunc: () {
              setState(() {
                if (indexSelect < 5) {
                  indexSelect++;
                  print('indexSelect ==> $indexSelect');
                }
              });
            },
            color: Colors.orange.shade700),
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

  Widget newStep1() {
    return Column(
      children: [
        newTitle(title: 'ข้อมูลโรงเรียนที่ต้องการลงทะเบียน'),
        
        newTitle(title: 'เลขบัตรประจำตัวผู้ปกครอง'),
        ShowForm(
          textInputType: TextInputType.number,
          hind: 'กรอกเลขบัตรประจำตัวประชาชน 13 หลัก',
          digit: 13,
          changeFunc: (String string) {},
        ),
        newTitle(title: 'วันเดือนปีเกิดผู้ปกครอง'),
        newTitle(title: 'เบอร์โทรศัพท์ผู้ปกคอรง'),
        ShowForm(
          textInputType: TextInputType.number,
          hind: 'เบอร์โทรศัพท์ 10 หลัก',
          digit: 10,
          changeFunc: (String string) {},
        ),
      ],
    );
  }

  DropdownButton<String> newDropdown() {
    return DropdownButton<String>(
          hint: const ShowText(
            label: 'เลือกโรงเรียน',
          ),
          value: school,
          items: nameSchools
              .map(
                (e) => DropdownMenuItem(
                  child: ShowText(label: e),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              school = value;
            });
          });
  }

  Row newTitle({required String title}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ShowText(
            label: title,
            textStyle: MyConstant().h2Style(),
          ),
        ),
      ],
    );
  }

  Widget newStep2() => Text('content step 2');

  Widget newStep3() => Text('content step 3');

  Widget newStep4() => Text('content step 4');

  Widget newStep5() => Text('content step 5');

  Row newCenter({required Widget widget}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget,
      ],
    );
  }
}
