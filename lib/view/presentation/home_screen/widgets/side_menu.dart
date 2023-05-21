import 'package:blood_bank/model/bloodImages.dart';
import 'package:blood_bank/view/presentation/auth/login/login.dart';
import 'package:blood_bank/view/presentation/history/history_view.dart';
import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:blood_bank/view/shared/component/device_size.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:blood_bank/view/shared/network/local/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Requests/requests_sideBar_view.dart';

class NaveBar extends StatefulWidget {
  const NaveBar({super.key});

  @override
  State<NaveBar> createState() => _NaveBarState();
}

class _NaveBarState extends State<NaveBar> {
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Container(
      height: 1.2 * LayoutSize.layoutValue!,
      width: LayoutSize.screenWidth! / 2,
      decoration: const BoxDecoration(
        color: anotherColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(27), bottomRight: Radius.circular(27)),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            BloodImages(CacheHelper.getData(key: 'userBloodType'))
                .getBloodImages(),
            width: 88,
            height: 119,
          ),
          Text(
            CacheHelper.getData(key: 'userName'),
            style: const TextStyle(
              fontSize: 18,
              color: secondaryColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 0.08 * LayoutSize.layoutValue!,
          ),
          const Linesapce(),
          UserOptions(
            text: 'donates\t\t',
            onTap: () {
              nextScreen(context, const HistoryView());
            },
          ),
          const Linesapce(),
          UserOptions(
            text: 'requests ',
            onTap: () {
              nextScreen(context, const RequestsSideBarView());
            },
          ),
          const Linesapce(),
          UserOptions(text: 'profile\t\t\t\t ', onTap: () {}),
          const Linesapce(),
          SizedBox(
            height: 0.08 * LayoutSize.layoutValue!,
          ),
          SizedBox(
            width: 166,
            height: 40,
            child: GeneralcustomButton(
              selected: true,
              text: 'Sign out',
              onTap: () {
                logout();
                CacheHelper.removeData(key: 'token');
                CacheHelper.removeData(key: 'userEmail');
                CacheHelper.removeData(key: 'userPhoneNumber');
                CacheHelper.removeData(key: 'userName');
                CacheHelper.removeData(key: 'userDate');
                CacheHelper.removeData(key: 'userLocation');
                CacheHelper.removeData(key: 'userBloodType');
                nextScreen(context, const LogIn());
              },
            ),
          ),
        ],
      ),
    );
  }
}

logout() async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {'Authorization': 'Token $token'};
  var request =
      http.Request('POST', Uri.parse('http://127.0.0.1:8000/logout/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
  } else {}
}
