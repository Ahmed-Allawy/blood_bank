import 'package:blood_bank/view/presentation/home_screen/home_body.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/material.dart';

import 'widgets/history_view_body.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage2(
      pageTitle: 'History',
      doneOntap: () {},
      backOntap: () {
        nextScreenRep(context, const Home());
      },
      buttonCaption: 'Back',
      email: 'fsdfsad@dfgaml.ocm',
      emailImage: Icons.email,
      leftButtonCaption: 'Donated',
      location: 'dsdds',
      locationImage: Icons.location_on,
      phoneImage: Icons.phone,
      phoneNumber: 'dsddssdvsd',
      rightButtonCation: 'Received',
    );
  }
}
