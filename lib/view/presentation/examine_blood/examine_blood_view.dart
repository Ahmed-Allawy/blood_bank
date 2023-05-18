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
    return const ExamineBlood(
      email: 'ahmed@gmail.com',
      location: 'phaqos-elshaqia',
      personName: 'Ahmed Zena',
      phoneNumber: "01023546",
    );
  }
}
