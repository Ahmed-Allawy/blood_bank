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
    return const BloodBankViewBody(
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
      dateTextB: '24/12/2023',
      personNameB: 'Ahmed Allawy',
      timeB: '3 : 00 Am',
      personLocationB: '123,xyz,apt',
      personImageB: 'assets/O.png',
    );
  }
}

///// requests API(get all)
///{
///date, time, name, location, blood group, status(accepted or pendding)
///} i can change status
///****************************************/
///Donates API(get all)
///{
///date, time, name, location, blood group
///}
//////****************************************/
///Bank API(get all)
///{
///date, time, name, location, blood group
///} i can remove any item
