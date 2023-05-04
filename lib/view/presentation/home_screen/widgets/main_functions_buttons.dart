import 'package:blood_bank/view/shared/component/device_size.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/components.dart';

class MainFunctionsButtons extends StatelessWidget {
  const MainFunctionsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        MainButton(
          text: 'Donate',
          image: 'assets/donate.png',
          onTap: () {},
        ),
        SizedBox(
          width: 0.1 * LayoutSize.layoutValue!,
        ),
        MainButton(
          text: 'Request',
          image: 'assets/request.png',
          onTap: () {},
        ),
      ]),
      SizedBox(
        height: 0.1 * LayoutSize.layoutValue!,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        MainButton(
          text: 'Find A\nDonor',
          image: 'assets/find.png',
          onTap: () {},
        ),
        SizedBox(
          width: 0.1 * LayoutSize.layoutValue!,
        ),
        MainButton(
          text: 'Blood Bank',
          image: 'assets/blood_bank.png',
          onTap: () {},
        ),
      ]),
    ]);
  }
}
