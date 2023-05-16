// ignore: must_be_immutable
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import '../../../shared/component/helperfunctions.dart';
import '../../home_screen/home_body.dart';
import 'requests_cards.dart';

class RequestsSideBarBody extends StatefulWidget {
  const RequestsSideBarBody(
      {Key? key,
      required this.dateText,
      required this.personName,
      required this.time,
      required this.personLocation,
      required this.status,
      required this.personImage,
      required this.onTap})
      : super(key: key);

  final VoidCallback? onTap;

  final String? dateText;
  final String? personName;
  final String? time;
  final String? personLocation;
  final bool? status;
  final String? personImage;
  @override
  State<RequestsSideBarBody> createState() => _RequestsSideBarBodyState();
}

class _RequestsSideBarBodyState extends State<RequestsSideBarBody> {
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
            onPressed: () {
              nextScreenRep(context, const Home());
            },
          ),
          centerTitle: true,
          title: const Text(
            'MY Requests',
            style: TextStyle(
              fontSize: 36,
              color: secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 7,
          padding:
              EdgeInsets.symmetric(vertical: 0.15 * LayoutSize.layoutValue!),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding:
                    EdgeInsets.only(bottom: 0.08 * LayoutSize.layoutValue!),
                child: RequestCards(
                  dateText: widget.dateText,
                  personName: widget.personName,
                  time: widget.time,
                  personLocation: widget.personLocation,
                  status: widget.status,
                  personImage: widget.personImage,
                  onTap: widget.onTap,
                ));
          },
        ));
  }
}
