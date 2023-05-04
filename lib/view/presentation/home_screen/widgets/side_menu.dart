import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:blood_bank/view/shared/component/device_size.dart';
import 'package:flutter/material.dart';

class NaveBar extends StatefulWidget {
  const NaveBar({super.key});

  @override
  State<NaveBar> createState() => _NaveBarState();
}

class _NaveBarState extends State<NaveBar> {
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Container(
      height: 1.2 * LayoutSize.layoutValue!,
      width: LayoutSize.screenWidth! / 2,
      decoration: const BoxDecoration(
        color: anotherColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(27), bottomRight: Radius.circular(27)),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/O.png',
            width: 88,
            height: 119,
          ),
          const Text(
            'Ahmed allawy',
            style: TextStyle(
              fontSize: 18,
              color: secondaryColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 0.08 * LayoutSize.layoutValue!,
          ),
          const Linesapce(),
          UserOptions(
            text: 'history\t\t\t\t',
            onTap: () {},
          ),
          const Linesapce(),
          UserOptions(
            text: 'requests ',
            onTap: () {},
          ),
          const Linesapce(),
          UserOptions(text: 'profile\t\t\t\t ', onTap: () {}),
          const Linesapce(),
          SizedBox(
            height: 0.08 * LayoutSize.layoutValue!,
          ),
          SizedBox(
            width: 166,
            height: 40,
            child: GeneralcustomButton(
              text: 'Sign out',
              onTap: () {
                setState(() {
                  print('vdsvdsv');
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
