// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';

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
        ],
      ),
    );
  }
}
