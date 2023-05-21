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
    this.personImage,
  });
  final String? dateText;
  final String? personName;
  final String? time;
  final String? personLocation;
  final String? personImage;
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Center(
      child: Container(
        height: LayoutSize.layoutValue! * 0.27,
        width: LayoutSize.layoutValue! * 0.9,
        decoration: const BoxDecoration(
            color: anotherColor,
            borderRadius: BorderRadius.all(Radius.circular(11))),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      text: "Date: $dateText",
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
                Column(children: <Widget>[
                  TextField(
                    text: 'Donte name $personName',
                  ),
                  if (personImage != null)
                    Image.asset(
                      personImage!,
                      width: 88,
                      height: 119,
                    ),
                ])
              ]),
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
