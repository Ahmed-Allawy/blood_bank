// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'package:blood_bank/view/presentation/home_screen/home_body.dart';
import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/material.dart';

import 'widgets/donate_view_body.dart';

class DonateView extends StatefulWidget {
  const DonateView({super.key});

  @override
  State<DonateView> createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {
  @override
  Widget build(BuildContext context) {
    return DonateViewBody(
      email: 'dgdssd@sdgd.com',
      location: 'cdscdsdsc',
      doneOntap: () {
        setState(() {
          print("object");
          // sendBloodRequest();
          // signup(user);
        });
      },
      phoneNumber: '0101021342',
      imageBlood: 'assets/O.png',
      personName: 'Ahmed allawy',
    );
  }
}
/// Self API (get)
/// {
/// bloog group,
/// name,
/// location,
/// phone number,
/// email
/// } i can make donate with these info
