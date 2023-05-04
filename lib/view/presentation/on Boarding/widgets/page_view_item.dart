import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, this.title, this.subTitle, this.image})
      : super(key: key);

  final String? title;
  final String? subTitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.115,
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.375,
          child: Image.asset(
            image!,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.003125,
        ),
        Text(
          subTitle!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 15,
            color: anotherColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
