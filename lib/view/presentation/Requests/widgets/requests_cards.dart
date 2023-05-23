import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:blood_bank/view/shared/component/device_size.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/components.dart';

class RequestCards extends StatefulWidget {
  const RequestCards(
      {super.key,
      required this.dateText,
      required this.personName,
      required this.time,
      required this.personLocation,
      required this.status,
      required this.personImage,
      required this.onTap});
  final String? dateText;
  final String? personName;
  final String? time;
  final String? personLocation;
  final bool? status;
  final String? personImage;
  final VoidCallback? onTap;
  @override
  State<RequestCards> createState() => _RequestCardsState();
}

class _RequestCardsState extends State<RequestCards> {
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Center(
      child: Container(
        // height: LayoutSize.layoutValue! * 0.4,
        width: LayoutSize.layoutValue! * 0.9,
        decoration: const BoxDecoration(
            color: anotherColor,
            borderRadius: BorderRadius.all(Radius.circular(11))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      text: "Date: ${widget.dateText}",
                    ),
                    SizedBox(
                      height: LayoutSize.layoutValue! * 0.025,
                    ),
                    TextField(
                      text: "Time: ${widget.time}",
                    ),
                    SizedBox(
                      height: LayoutSize.layoutValue! * 0.025,
                    ),
                    TextField(
                      text: "Location: ${widget.personLocation}",
                    ),
                    SizedBox(
                      height: LayoutSize.layoutValue! * 0.035,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(children: <Widget>[
                        if (!widget.status!)
                          SizedBox(
                            width: 125,
                            height: 37,
                            child: GeneralcustomButton(
                              text: widget.status! ? "Done" : "Cancel",
                              onTap: widget.onTap,
                              selected: true,
                            ),
                          ),
                        SizedBox(
                          width: LayoutSize.layoutValue! * 0.02,
                        ),
                        TextField(
                          text: widget.status! ? "Accepted" : "Pending",
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(children: <Widget>[
                  TextField(
                    text: widget.personName,
                  ),
                  if (widget.personImage != null)
                    Image.asset(
                      widget.personImage!,
                      width: 88,
                      height: 119,
                    ),
                ]),
              ),
            ]),
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
