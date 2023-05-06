// ignore: must_be_immutable
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import 'requests_cards.dart';

class RequestsSideBarBody extends StatefulWidget {
  const RequestsSideBarBody({
    Key? key,
    required this.pageTitle,
    required this.doneOntap,
    required this.buttonCaption,
    required this.backOntap,
  }) : super(key: key);

  final String? pageTitle;

  final String? buttonCaption;
  final VoidCallback? doneOntap;
  final VoidCallback? backOntap;
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
        body: ListView.builder(
          itemCount: 7,
          padding:
              EdgeInsets.symmetric(vertical: 0.15 * LayoutSize.layoutValue!),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding:
                    EdgeInsets.only(bottom: 0.08 * LayoutSize.layoutValue!),
                child: const RequestCards(
                  dateText: '24/12/2023',
                  personName: 'Ahmed zena',
                  time: '3 : 00 Am',
                  personLocation: '123,xyz,apt',
                  status: true,
                  personImage: 'assets/O.png',
                ));
          },
        ));
  }
}
