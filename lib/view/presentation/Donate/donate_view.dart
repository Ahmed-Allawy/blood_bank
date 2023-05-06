// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'package:blood_bank/view/presentation/home_screen/home_body.dart';
import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/material.dart';

class DonateView extends StatefulWidget {
  const DonateView({super.key});

  @override
  State<DonateView> createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage1(
      backOntap: () {
        nextScreenRep(context, const Home());
      },
      buttonCaption: 'Next',
      email: 'dgdssd@sdgd.com',
      location: 'cdscdsdsc',
      doneOntap: () {
        setState(() {
          print("object");
        });
      },
      pageTitle: 'Donate',
      phoneNumber: '0101021342',
      leftButtonCaption: 'Self',
      rightButtonCation: 'Other',
      imageBlood: 'assets/O.png',
      personName: 'Ahmed Allawy',
    );
  }
}
