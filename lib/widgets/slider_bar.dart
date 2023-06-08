import 'package:flutter/material.dart';
import 'package:smart_home_app/view/home.dart';
import '../utils/utils.dart';
import 'custom_slider.dart';

class SliderBar extends StatelessWidget {
  const SliderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.scrWidth -
          Utils.restrictArea, // Used for padding (Outside + In-between)
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: sideBarDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          children: [
            sliderTile(lamp: "Main Light", icon: "Lamp"),
            sliderTile(lamp: "Floor Light", icon: "Tablelamp")
          ],
        ),
      ),
    );
  }

  BoxDecoration sideBarDecoration() {
    return BoxDecoration(
      color: const Color(0xff282424),
      borderRadius: BorderRadius.circular(24),
    );
  }

  Column sliderTile({required String lamp, required String icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.regularText12(title: lamp),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSlider(mainLight: lamp == "Main Light"),
            Utils.showIcon(icon: icon),
          ],
        ),
      ],
    );
  }
}
