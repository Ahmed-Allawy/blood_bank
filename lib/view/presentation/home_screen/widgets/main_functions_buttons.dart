import 'package:blood_bank/view/presentation/Blood_Request/Blood_request_view.dart';
import 'package:blood_bank/view/presentation/Donate/donate_view.dart';
import 'package:blood_bank/view/shared/component/device_size.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/components.dart';

class MainFunctionsButtons extends StatefulWidget {
  const MainFunctionsButtons({Key? key}) : super(key: key);

  @override
  State<MainFunctionsButtons> createState() => _MainFunctionsButtonsState();
}

class _MainFunctionsButtonsState extends State<MainFunctionsButtons> {
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        MainButton(
          text: 'Donate',
          image: 'assets/donate.png',
          onTap: () {
            setState(() {
              nextScreen(context, const DonateView());
            });
          },
        ),
        SizedBox(
          width: 0.1 * LayoutSize.layoutValue!,
        ),
        MainButton(
          text: 'Request',
          image: 'assets/request.png',
          onTap: () {
            setState(() {
              nextScreen(context, const BloodRequestView());
            });
          },
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
