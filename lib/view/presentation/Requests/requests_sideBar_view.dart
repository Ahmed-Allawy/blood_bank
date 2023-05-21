// ignore_for_file: file_names

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
    return const RequestsSideBarBody();
  }
}
