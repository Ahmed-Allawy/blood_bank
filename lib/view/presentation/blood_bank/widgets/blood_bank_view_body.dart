// ignore: must_be_immutable
import 'package:blood_bank/view/presentation/examine_blood/examine_blood_view.dart';
import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';

class BloodBankViewBody extends StatefulWidget {
  const BloodBankViewBody({
    Key? key,
    required this.pageTitle,
    required this.backOntap,
    required this.leftButtonCaption,
    required this.rightButtonCation,
    required this.middleButtonCaption,
    required this.requestAccept,
    required this.dateTextR,
    required this.personNameR,
    required this.timeR,
    required this.personLocationR,
    required this.personImageR,
    required this.dateTextD,
    required this.personNameD,
    required this.timeD,
    required this.personLocationD,
    required this.personImageD,
  }) : super(key: key);

  final String? pageTitle;
  final VoidCallback? backOntap;
  final String? leftButtonCaption;
  final String? rightButtonCation;
  final String? middleButtonCaption;
  final bool? requestAccept;
  final String? dateTextR;
  final String? personNameR;
  final String? timeR;
  final String? personLocationR;
  final String? personImageR;
  final String? dateTextD;
  final String? personNameD;
  final String? timeD;
  final String? personLocationD;
  final String? personImageD;
  @override
  State<BloodBankViewBody> createState() => _BloodBankViewBodyState();
}

class _BloodBankViewBodyState extends State<BloodBankViewBody> {
  bool requestButton = true;
  bool donateButtonState = false;
  bool btnThirdState = false;
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
          children: <Widget>[
            SizedBox(
              height: 0.08 * LayoutSize.layoutValue!,
            ),
            ThreeButtons(
              leftButtonCaption: widget.leftButtonCaption,
              rightButtonCation: widget.rightButtonCation,
              middleButtonCaption: widget.middleButtonCaption,
              requestButton: requestButton,
              btnThirdState: btnThirdState,
              donateButtonState: donateButtonState,
              ontapOne: () {
                setState(() {
                  requestButton = true;
                  donateButtonState = false;
                  btnThirdState = false;
                });
              },
              ontapTwo: () {
                setState(() {
                  requestButton = false;
                  donateButtonState = true;
                  btnThirdState = false;
                });
              },
              ontapThree: () {
                setState(() {
                  requestButton = false;
                  donateButtonState = false;
                  btnThirdState = true;
                });
              },
            ),
            if (requestButton)
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  padding: EdgeInsets.symmetric(
                      vertical: 0.15 * LayoutSize.layoutValue!),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            bottom: 0.08 * LayoutSize.layoutValue!),
                        child: BloodBankCards(
                          dateText: widget.dateTextR,
                          personName: widget.personNameR,
                          time: widget.timeR,
                          personLocation: widget.personLocationR,
                          personImage: widget.personImageR,
                          buttonCaption:
                              widget.requestAccept! ? "Done" : "Accept",
                          onTapButton: () {},
                        ));
                  },
                ),
              ),
            if (donateButtonState)
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  padding: EdgeInsets.symmetric(
                      vertical: 0.15 * LayoutSize.layoutValue!),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            bottom: 0.08 * LayoutSize.layoutValue!),
                        child: BloodBankCards(
                          dateText: widget.dateTextD,
                          personName: widget.personNameD,
                          time: widget.timeD,
                          personLocation: widget.personLocationD,
                          personImage: widget.personImageD,
                          buttonCaption: 'examine',
                          onTapButton: () {
                            nextScreen(context, const ExamineBloodView());
                          },
                        ));
                  },
                ),
              ),
          ],
        ));
  }
}

class ThreeButtons extends StatefulWidget {
  const ThreeButtons(
      {super.key,
      required this.leftButtonCaption,
      required this.rightButtonCation,
      required this.middleButtonCaption,
      required this.requestButton,
      required this.donateButtonState,
      required this.btnThirdState,
      required this.ontapOne,
      required this.ontapTwo,
      required this.ontapThree});
  final String? leftButtonCaption;
  final String? rightButtonCation;
  final String? middleButtonCaption;
  final bool requestButton;
  final bool donateButtonState;
  final bool btnThirdState;
  final VoidCallback? ontapOne;
  final VoidCallback? ontapTwo;
  final VoidCallback? ontapThree;
  @override
  State<ThreeButtons> createState() => _ThreeButtonsState();
}

class _ThreeButtonsState extends State<ThreeButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 0.08 * LayoutSize.layoutValue!,
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 55,
            child: GeneralcustomButton(
              text: widget.leftButtonCaption,
              selected: widget.requestButton,
              onTap: widget.ontapOne,
            ),
          ),
        ),
        SizedBox(
          width: 0.04 * LayoutSize.layoutValue!,
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 55,
            child: GeneralcustomButton(
              text: widget.middleButtonCaption,
              selected: widget.donateButtonState,
              onTap: widget.ontapTwo,
            ),
          ),
        ),
        SizedBox(
          width: 0.04 * LayoutSize.layoutValue!,
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 55,
            child: GeneralcustomButton(
              text: widget.rightButtonCation,
              selected: widget.btnThirdState,
              onTap: widget.ontapThree,
            ),
          ),
        ),
        SizedBox(
          width: 0.08 * LayoutSize.layoutValue!,
        ),
      ],
    );
  }
}
