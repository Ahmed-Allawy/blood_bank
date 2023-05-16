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
      dateText: '24/12/2023',
      personName: 'Ahmed zena',
      time: '3 : 00 Am',
      personLocation: '123,xyz,apt',
      status: false,
      personImage: 'assets/O.png',
      onTap: () {},
    );
  }
}

//// get my requests
///{
///date, time, location, name(self or other), blood group, status(accepted or pending)
///} i can remove pending requests
