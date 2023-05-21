// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'package:blood_bank/model/bloodImages.dart';
import 'package:blood_bank/view/shared/network/local/cach_helper.dart';
import 'package:flutter/material.dart';

import 'widgets/donate_view_body.dart';

class DonateView extends StatefulWidget {
  const DonateView({super.key});

  @override
  State<DonateView> createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {
  @override
  Widget build(BuildContext context) {
    return DonateViewBody(
      email: CacheHelper.getData(key: 'userEmail'),
      location: CacheHelper.getData(key: 'userLocation'),
      phoneNumber: (CacheHelper.getData(key: 'userPhoneNumber')).toString(),
      imageBlood: BloodImages(CacheHelper.getData(key: 'userBloodType'))
          .getBloodImages(),
      personName: CacheHelper.getData(key: 'userName'),
    );
  }
}
