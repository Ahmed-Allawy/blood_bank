// ignore: must_be_immutable
import 'package:blood_bank/view/presentation/history/widgets/history_cards.dart';
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
  bool view = false;
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
                //print('pageNumber is false');
              });
            },
            leftButtonCaption: widget.leftButtonCaption,
            rightButtonCation: widget.rightButtonCation,
            leftButtonOntap: () {
              setState(() {
                _pageNumber = true;
                //print('pageNumber is true');
              });
            },
          ),
          if (_pageNumber)
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                padding: EdgeInsets.symmetric(
                    vertical: 0.15 * LayoutSize.layoutValue!),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.only(
                          bottom: 0.08 * LayoutSize.layoutValue!),
                      child: const HistoryDonatesCards(
                        dateText: '24/12/2023',
                        personName: '45',
                        time: '3 : 00 Am',
                        personLocation: '123,xyz,apt',
                        qty: "0.6 ounces",
                      ));
                },
              ),
            )
          else
            Expanded(
              child: Stack(children: <Widget>[
                ListView.builder(
                  itemCount: 7,
                  padding: EdgeInsets.symmetric(
                      vertical: 0.15 * LayoutSize.layoutValue!),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            bottom: 0.08 * LayoutSize.layoutValue!),
                        child: HistoryReceivedCards(
                          dateText: '24/12/2023',
                          personName: '45',
                          time: '3 : 00 Am',
                          personLocation: '123,xyz,apt',
                          qty: "0.6 ounces",
                          onTap: () {
                            setState(() {
                              view = true;
                            });
                          },
                        ));
                  },
                ),
                if (view)
                  Center(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 0.1 * LayoutSize.layoutValue!,
                                vertical: 0.2 * LayoutSize.layoutValue!,
                              ),
                              child: GeneralUserInfo(
                                buttonCaption: 'Back',
                                email: 'ahmed@gmail.com',
                                location: 'phaqos-elshaqia',
                                ontap: () {
                                  setState(() {
                                    view = false;
                                  });
                                },
                                phoneNumber: '0102332433',
                                imageBlood: 'assets/O.png',
                                personName: "Ahmed Allawy Zena",
                              ))))
              ]),
            )
        ],
      ),
    );
  }
}
