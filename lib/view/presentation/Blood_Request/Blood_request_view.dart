// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'package:blood_bank/view/shared/component/components.dart';
import 'package:flutter/material.dart';

import '../../shared/component/helperfunctions.dart';
import '../home_screen/home_body.dart';

class BloodRequestView extends StatefulWidget {
  const BloodRequestView({super.key});

  @override
  State<BloodRequestView> createState() => _BloodrequestViewState();
}

class _BloodrequestViewState extends State<BloodRequestView> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage1(
      backOntap: () {
        nextScreenRep(context, const Home());
      },
      buttonCaption: 'Rquest blood',
      email: 'dgdssd@sdgd.com',
      location: 'cdscdsdsc',
      doneOntap: () {
        setState(() {
          print("object");
        });
      },
      pageTitle: 'Blood Blood',
      phoneNumber: '0101021342',
      leftButtonCaption: 'Self',
      rightButtonCation: 'Other',
      imageBlood: 'assets/O.png',
      personName: 'Ahmed allawy',
    );
  }
}
