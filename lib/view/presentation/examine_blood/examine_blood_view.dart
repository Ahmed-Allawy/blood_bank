import 'package:blood_bank/view/presentation/blood_bank/blood_bank_view.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/examine_blood_view_body.dart';

class ExamineBloodView extends StatefulWidget {
  const ExamineBloodView({super.key});

  @override
  State<ExamineBloodView> createState() => _ExamineBloodViewState();
}

class _ExamineBloodViewState extends State<ExamineBloodView> {
  @override
  Widget build(BuildContext context) {
    return ExamineBlood(
      pageTitle: "Examine Blood",
      email: 'ahmed@gmail.com',
      location: 'phaqos-elshaqia',
      phoneNumber: '0102332433',
      personName: "Ahmed Allawy Zena",
      backOntap: () {
        nextScreenRep(context, const BloodBankView());
      },
      ontap: () {},
    );
  }
}