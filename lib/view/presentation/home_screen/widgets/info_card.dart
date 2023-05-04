import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import '../../../shared/component/components.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';

class InfoCards extends StatefulWidget {
  const InfoCards({super.key});

  @override
  State<InfoCards> createState() => _InfoCardsState();
}

class _InfoCardsState extends State<InfoCards> {
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return SizedBox(
      height: 0.3 * LayoutSize.layoutValue!,
      width: double.infinity,
      child: CarouselSlider(
          unlimitedMode: true,
          slideIndicator: CircularSlideIndicator(
              indicatorBackgroundColor: Colors.black,
              currentIndicatorColor: secondaryColor),
          enableAutoSlider: true,
          scrollDirection: Axis.horizontal,
          children: const <Widget>[
            BloodInfo(
              text:
                  'Giving blood may lower\nyour risk of suffering\na heart attack',
              image: 'assets/B1.png',
            ),
            BloodInfo(
              text: 'Giving blood may reduce\nyour risk of developing\ncancer',
              image: 'assets/B2.png',
            ),
            BloodInfo(
              text: 'Giving blood can help\nyour liver stay healthy',
              image: 'assets/B3.png',
            ),
            BloodInfo(
              text: 'Giving blood can reduce\nharmful iron stores',
              image: 'assets/B4.png',
            ),
            BloodInfo(
              text: 'Giving blood can reveal\npotential health\nproblems',
              image: 'assets/B5.png',
            ),
          ]),
    );
  }
}
