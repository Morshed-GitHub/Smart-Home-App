import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/utils.dart';
import '../widgets/air_options.dart';
import '../widgets/slider_bar.dart';

extension MediaQueryExtension on BuildContext {
  double get scrWidth => MediaQuery.of(this).size.width;
  double get scrHeight => MediaQuery.of(this).size.height;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: headerBgImg(),
        ),
        Positioned(
            top: context.scrHeight * .07, child: buildCustomAppBar(context)),
        Positioned(
          top: context.scrHeight * .35,
          child: Column(
            children: [airRow(), const SliderBar()],
          ),
        ),
      ],
    ));
  }

  Row airRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AirOption(
          percentage: "36%",
          air: "Humidifer\nAir",
          icon: "humidity",
          mode: "Mode 2",
        ),
        AirOption(
          percentage: "73%",
          air: "Purifier\nAir",
          icon: "clean",
          mode: "On",
        ),
      ],
    );
  }

  Widget buildCustomAppBar(BuildContext context) {
    return SizedBox(
      width: context.scrWidth - Utils.restrictArea,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIcon(icon: Icons.arrow_back_ios),
          buildTitleText(),
          buildIcon(icon: CupertinoIcons.bell)
        ],
      ),
    );
  }

  Widget buildTitleText() {
    return Utils.semiBoldText(
      title: "Bedroom",
      color: Colors.white,
      fontsize: 17,
    );
  }

  Widget buildIcon({required IconData icon}) {
    return Icon(icon, color: Colors.white, size: 20);
  }

  Image headerBgImg() {
    return Image.asset(
      "assets/images/home bg.jpg",
    );
  }
}
