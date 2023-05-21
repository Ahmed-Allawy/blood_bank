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
    return const HistoryViewBody(
      dateTextR: '24/12/2023',
      receiverID: '13',
      timeR: '3 : 00 Am',
      personLocationR: '123,xyz,apt',
    );
  }
}
