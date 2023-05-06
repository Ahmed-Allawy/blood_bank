import 'package:blood_bank/view/shared/component/components.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';

class ExamineBlood extends StatefulWidget {
  const ExamineBlood(
      {super.key,
      required this.pageTitle,
      required this.backOntap,
      required this.location,
      required this.phoneNumber,
      required this.email,
      required this.ontap,
      required this.personName});
  final String? pageTitle;
  final VoidCallback? backOntap;
  final String? location;
  final String? phoneNumber;
  final String? email;
  final VoidCallback? ontap;

  final String? personName;
  @override
  State<ExamineBlood> createState() => _ExamineBloodState();
}

class _ExamineBloodState extends State<ExamineBlood> {
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          toolbarHeight: 0.16 * LayoutSize.layoutValue!,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: anotherColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(33),
                bottomRight: Radius.circular(33),
              ),
            ),
          ),
          leading: BackButton(
            color: secondaryColor,
            onPressed: widget.backOntap,
          ),
          centerTitle: true,
          title: Text(
            widget.pageTitle!,
            style: const TextStyle(
              fontSize: 36,
              color: secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 0.08 * LayoutSize.layoutValue!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: GeneralUserInfo(
                    location: widget.location,
                    phoneNumber: widget.phoneNumber,
                    email: widget.email,
                    personName: widget.personName),
              ),
              SizedBox(
                width: 130,
                height: 40,
                child: GeneralcustomButton(
                  text: "Done",
                  onTap: widget.ontap,
                  selected: true,
                ),
              ),
            ],
          ),
        ));
  }
}
