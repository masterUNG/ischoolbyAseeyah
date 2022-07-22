import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ischool/model/school_model.dart';
import 'package:ischool/states/step2.dart';
import 'package:ischool/utility/my_constant.dart';
import 'package:ischool/widgets/show_button.dart';
import 'package:ischool/widgets/show_form.dart';
import 'package:steps_indicator/steps_indicator.dart';

import '../widgets/show_text.dart';

class Step1 extends StatefulWidget {
  const Step1({Key? key}) : super(key: key);

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  var titles = MyConstant.headerCreateAccount;
  var schoolModels = <SchoolModel>[];
  bool load = true;
  var nameSchools = <String>[];
  String? school;
  DateTime dateTime = DateTime.now();

  String? birthday;

  @override
  void initState() {
    super.initState();
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

  Widget newStep1() {
    return Column(
      children: [
        newTitle(title: 'ข้อมูลโรงเรียนที่ต้องการลงทะเบียน'),
        newDropdown(),
        newTitle(title: 'เลขบัตรประจำตัวผู้ปกครอง'),
        ShowForm(
          textInputType: TextInputType.number,
          hind: 'กรอกเลขบัตรประจำตัวประชาชน 13 หลัก',
          digit: 13,
          changeFunc: (String string) {},
        ),
        newTitle(title: 'วันเดือนปีเกิดผู้ปกครอง'),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          width: 300,
          child: ListTile(
            title: ShowText(
                label: birthday == null
                    ? 'คลิกเลือกข้อมูล วันเดือนปีเกิด'
                    : birthday!),
            trailing: IconButton(
                onPressed: () {
                  processDate();
                },
                icon: Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.blue,
                )),
          ),
        ),
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

  Widget newDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4)),
      child: DropdownButton<String>(
          underline: const SizedBox(),
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
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
          child: Stack(
            children: [
              newBottom(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          child: ShowText(
                            label: titles[1],
                            textStyle: MyConstant().h2Style(),
                          ),
                        ),
                      ],
                    ),
                    StepsIndicator(
                      lineLength: 60,
                      selectedStep: 1,
                      nbSteps: 6,
                    ),
                    newStep1(),
                  ],
                ),
              ),
            ],
          ),
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
                        builder: (context) => const Step2(),
                      ));
                },
                color: Colors.orange.shade700),
          ],
        ),
      ],
    );
  }

  Future<void> processDate() async {
    DateTime? chooseDateTime = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(dateTime.year - 50),
        lastDate: DateTime(dateTime.year + 50));
    if (chooseDateTime != null) {

      DateFormat dateformat = DateFormat('dd MMMM yyyy');

      setState(() {
        
        birthday = dateformat.format(chooseDateTime);
      });
    }
  }
}
