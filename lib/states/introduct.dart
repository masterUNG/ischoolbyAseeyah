import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ischool/states/create_account.dart';
import 'package:ischool/states/step0.dart';
import 'package:ischool/utility/my_constant.dart';

class Introduct extends StatefulWidget {
  const Introduct({Key? key}) : super(key: key);

  @override
  State<Introduct> createState() => _IntroductState();
}

class _IntroductState extends State<Introduct> {
  var titles = MyConstant.titles;
  var subTitles = MyConstant.subTitles;
  var sub2Titles = MyConstant.sub2Titles;
  var pageViewModels = <PageViewModel>[];
  var paths = [
    'images/intro1.png',
    'images/intro2.png',
    'images/intro3.png',
  ];

  @override
  void initState() {
    super.initState();

    print('titles ==> $titles');
    print('subTitles ==> $subTitles');
    print('sub2Titles ==> $sub2Titles');

    for (var i = 0; i < titles.length; i++) {
      pageViewModels.add(createPageViewModel(
          title: titles[i],
          subTitle: subTitles[i],
          sub2Title: sub2Titles[i],
          path: paths[i]));
    }
  }

  PageViewModel createPageViewModel({
    required String title,
    required String subTitle,
    required String sub2Title,
    required String path,
  }) {
    return PageViewModel(
        decoration: PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        title: title,
        body: '$subTitle \n $sub2Title',
        image: SizedBox(
            width: double.infinity,
            child: Image.asset(
              path,
              fit: BoxFit.fill,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IntroductionScreen(
        pages: pageViewModels,
        onDone: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Step0(),
              ),
              (route) => false);
        },
        done: Text('สมัครสมาชิก'),
        next: Text('ต่อไป'),
        skip: Text('ข้าม'),
        showSkipButton: true,
        showNextButton: true,
      )),
    );
  }
}
