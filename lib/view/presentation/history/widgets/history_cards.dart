import 'package:blood_bank/view/shared/component/components.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';

class HistoryDonatesCards extends StatelessWidget {
  const HistoryDonatesCards({
    super.key,
    required this.dateText,
    required this.personName,
    required this.time,
    required this.personLocation,
  });
  final String? dateText;
  final String? personName;
  final String? time;
  final String? personLocation;

  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Center(
      child: Container(
        height: LayoutSize.layoutValue! * 0.33,
        width: LayoutSize.layoutValue! * 0.9,
        decoration: const BoxDecoration(
            color: anotherColor,
            borderRadius: BorderRadius.all(Radius.circular(11))),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  TextField(
                    text: "Date: $dateText",
                  ),
                  SizedBox(
                    width: (LayoutSize.layoutValue! * 0.9) / 4.5,
                  ),
                  TextField(
                    text: "Receiver ID : $personName",
                  ),
                ],
              ),
              SizedBox(
                height: LayoutSize.layoutValue! * 0.025,
              ),
              TextField(
                text: "Time: $time",
              ),
              SizedBox(
                height: LayoutSize.layoutValue! * 0.025,
              ),
              TextField(
                text: "Location: $personLocation",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  const TextField({
    super.key,
    this.text,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
        fontSize: 16,
        color: secondaryColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class HistoryReceivedCards extends StatelessWidget {
  const HistoryReceivedCards({
    super.key,
    required this.dateText,
    required this.personName,
    required this.time,
    required this.personLocation,
    required this.onTap,
  });
  final String? dateText;
  final String? personName;
  final String? time;
  final String? personLocation;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Center(
      child: Container(
        height: LayoutSize.layoutValue! * 0.36,
        width: LayoutSize.layoutValue! * 0.9,
        decoration: const BoxDecoration(
            color: anotherColor,
            borderRadius: BorderRadius.all(Radius.circular(11))),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  TextField(
                    text: "Date: $dateText",
                  ),
                  SizedBox(
                    width: (LayoutSize.layoutValue! * 0.9) / 4.5,
                  ),
                  TextField(
                    text: "Donor ID : $personName",
                  ),
                ],
              ),
              SizedBox(
                height: LayoutSize.layoutValue! * 0.025,
              ),
              TextField(
                text: "Time: $time",
              ),
              SizedBox(
                height: LayoutSize.layoutValue! * 0.025,
              ),
              TextField(
                text: "Location: $personLocation",
              ),
              SizedBox(
                height: LayoutSize.layoutValue! * 0.02,
              ),
              SizedBox(
                width: 135,
                height: 37,
                child: GeneralcustomButton(
                  text: "View Details",
                  onTap: onTap,
                  selected: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
