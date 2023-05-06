import 'package:blood_bank/view/presentation/blood_bank/widgets/blood_bank_view_body.dart';
import 'package:blood_bank/view/presentation/home_screen/home_body.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/material.dart';

class BloodBankView extends StatefulWidget {
  const BloodBankView({super.key});

  @override
  State<BloodBankView> createState() => _BloodBankViewState();
}

class _BloodBankViewState extends State<BloodBankView> {
  @override
  Widget build(BuildContext context) {
    return BloodBankViewBody(
      pageTitle: "Manage Bloods",
      backOntap: () {
        nextScreenRep(context, const Home());
      },
      leftButtonCaption: "Rquests",
      rightButtonCation: "Bank",
      middleButtonCaption: 'Donates',
      requestAccept: true,
      dateTextR: '24/12/2023',
      personNameR: 'Ahmed Allawy',
      timeR: '3 : 00 Am',
      personLocationR: '123,xyz,apt',
      personImageR: 'assets/O.png',
      dateTextD: '24/12/2023',
      personNameD: 'Ahmed Allawy',
      timeD: '3 : 00 Am',
      personLocationD: '123,xyz,apt',
      personImageD: 'assets/BB.png',
    );
  }
}
