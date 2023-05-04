// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../../../shared/component/components.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';

class GeneralPage2 extends StatefulWidget {
  const GeneralPage2({
    Key? key,
    required this.pageTitle,
    required this.doneOntap,
    required this.location,
    required this.phoneNumber,
    required this.email,
    required this.buttonCaption,
    required this.backOntap,
    required this.locationImage,
    required this.phoneImage,
    required this.emailImage,
    required this.leftButtonCaption,
    required this.rightButtonCation,
  }) : super(key: key);

  final String? pageTitle;
  final String? location;
  final IconData? locationImage;
  final String? phoneNumber;
  final IconData? phoneImage;
  final String? email;
  final IconData? emailImage;
  final String? buttonCaption;
  final VoidCallback? doneOntap;
  final VoidCallback? backOntap;
  final String? leftButtonCaption;
  final String? rightButtonCation;
  @override
  State<GeneralPage2> createState() => _GeneralPage2State();
}

class _GeneralPage2State extends State<GeneralPage2> {
  bool _pageNumber = true;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 0.08 * LayoutSize.layoutValue!,
          ),
          GeneralOptionButtons(
            selected: _pageNumber,
            rightButtonOntap: () {
              setState(() {
                _pageNumber = false;
                print('pageNumber is false');
              });
            },
            leftButtonCaption: widget.leftButtonCaption,
            rightButtonCation: widget.rightButtonCation,
            leftButtonOntap: () {
              setState(() {
                _pageNumber = true;
                print('pageNumber is true');
              });
            },
          ),
          if (_pageNumber)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.1 * LayoutSize.layoutValue!,
                    vertical: 0.29 * LayoutSize.layoutValue!,
                  ),
                ),
              ),
            )
          else
            const Text("data"),
        ],
      ),
    );
  }
}
