import 'package:flutter/material.dart';
import 'package:smart_home_app/view/home.dart';
import '../utils/utils.dart';
import 'custom_toggle_switch.dart';

class AirOption extends StatelessWidget {
  const AirOption({
    Key? key,
    required this.percentage,
    required this.icon,
    required this.air,
    required this.mode,
  }) : super(key: key);

  final String percentage;
  final String icon;
  final String air;
  final String mode;

  @override
  Widget build(BuildContext context) {
    final halfScreen = context.scrWidth * .5; // 50 percent of screen width

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      width: (halfScreen -
          Utils.restrictArea), // Used for padding (Outside + In-between)
      decoration: BoxDecoration(
        color: const Color(0xff282424),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
        child: airDetailsCol(),
      ),
    );
  }

  Column airDetailsCol() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        percentageIconRow(),
        const SizedBox(height: 10),
        Utils.mediumText(title: air, color: Colors.white54, fontsize: 13),
        const SizedBox(height: 15),
        straightDivLine(),
        const SizedBox(height: 15),
        modeSwitchRow(),
      ],
    );
  }

  Row modeSwitchRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Utils.regularText12(title: mode),
        CustomToggleSwitch(air: air),
      ],
    );
  }

  Row percentageIconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Utils.mediumText(title: percentage, color: Colors.white, fontsize: 32),
        Utils.showIcon(icon: icon)
      ],
    );
  }

  Container straightDivLine() {
    return Container(
      height: 2,
      width: double.infinity,
      color: const Color(0xff393535),
    );
  }
}
