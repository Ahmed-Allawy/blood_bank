// ignore_for_file: file_names

import 'package:blood_bank/view/presentation/home_screen/home_body.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/material.dart';

import 'widgets/requests_sideBar_view_body.dart';

class RequestsSideBarView extends StatefulWidget {
  const RequestsSideBarView({super.key});

  @override
  State<RequestsSideBarView> createState() => _RequestsSideBarViewState();
}

class _RequestsSideBarViewState extends State<RequestsSideBarView> {
  @override
  Widget build(BuildContext context) {
    return RequestsSideBarBody(
      pageTitle: 'Requests',
      doneOntap: () {},
      backOntap: () {
        nextScreenRep(context, const Home());
      },
      buttonCaption: 'Back',
    );
  }
}
