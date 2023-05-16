// ignore: must_be_immutable
import 'package:blood_bank/view/presentation/history/widgets/history_cards.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/components.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import '../../../shared/component/helperfunctions.dart';
import '../../home_screen/home_body.dart';

class HistoryViewBody extends StatefulWidget {
  const HistoryViewBody({
    Key? key,
    required this.dateTextD,
    required this.timeD,
    required this.personLocationD,
    required this.dateTextR,
    required this.timeR,
    required this.personLocationR,
    required this.donarID,
    required this.receiverID,
    required this.donarName,
    required this.donarPhoneNumber,
    required this.donarEmail,
    required this.bloodType,
  }) : super(key: key);

  /// doner info
  final String? dateTextD;
  final String? donarID;
  final String? timeD;
  final String? personLocationD;
  //more info about donar
  final String? donarName;
  final String? donarPhoneNumber;
  final String? donarEmail;
  final String? bloodType;
  //// receiver info
  final String? dateTextR;
  final String? receiverID;
  final String? timeR;
  final String? personLocationR;
  @override
  State<HistoryViewBody> createState() => _HistoryViewBodyState();
}

class _HistoryViewBodyState extends State<HistoryViewBody> {
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
          onPressed: () {
            nextScreenRep(context, const Home());
          },
        ),
        centerTitle: true,
        title: const Text(
          'History',
          style: TextStyle(
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
            leftButtonCaption: 'Donated',
            rightButtonCation: "Received",
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
                      child: HistoryDonatesCards(
                          dateText: widget.dateTextR,
                          personName: widget.receiverID,
                          time: widget.timeR,
                          personLocation: widget.personLocationR));
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
                          dateText: widget.dateTextD,
                          personName: widget.donarID,
                          time: widget.timeD,
                          personLocation: widget.personLocationD,
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
                                  email: widget.donarEmail,
                                  location: widget.personLocationD,
                                  ontap: () {
                                    setState(() {
                                      view = false;
                                    });
                                  },
                                  phoneNumber: widget.donarPhoneNumber,
                                  imageBlood: widget.bloodType,
                                  personName: widget.donarName))))
              ]),
            )
        ],
      ),
    );
  }
}
