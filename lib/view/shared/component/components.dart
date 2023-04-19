import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:flutter/material.dart';

import 'device_size.dart';

class GeneralcustomButton extends StatelessWidget {
  const GeneralcustomButton({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: LayoutSize.screenWidth,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              fontSize: 20,
              color: fontColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ));
  }
}
