import 'package:flutter/material.dart';
import 'package:ischool/utility/my_constant.dart';
import 'package:ischool/widgets/show_icon_button.dart';
import 'package:ischool/widgets/show_text.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints boxConstraints) {
          return Container(
            decoration: MyConstant().orangeBox(),
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight * 0.3,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    iconUser(),
                    iconBell(),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  ShowIconButton iconBell() {
    return ShowIconButton(
      widget: const ImageIcon(
        AssetImage('images/bell.png'),
        color: Colors.white,
        size: 36,
      ),
      pressFunc: () {},
    );
  }

  ShowIconButton iconUser() {
    return ShowIconButton(
      widget: const ImageIcon(
        AssetImage('images/user.png'),
        color: Colors.white,
        size: 36,
      ),
      pressFunc: () {},
    );
  }
}
