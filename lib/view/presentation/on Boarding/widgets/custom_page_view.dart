// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'page_view_item.dart';

class CustomPageView extends StatelessWidget {
  CustomPageView({Key? key, @required this.pageController}) : super(key: key);
  PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          image: 'assets/ob1.png',
          subTitle: 'To be a responsible donor, you must get a check-up.',
        ),
        PageViewItem(
          image: 'assets/ob2.png',
          subTitle:
              'Your blood type should be compatible with the receiver’s type.',
        ),
        PageViewItem(
          image: 'assets/ob3.png',
          subTitle: 'Donate your blood and save a life.',
        ),
      ],
    );
  }
}
