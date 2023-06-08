import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home.dart';

class CustomToggleSwitch extends StatelessWidget {
  final String air;
  const CustomToggleSwitch({
    Key? key,
    required this.air,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      final bool isHumidAir = (air == "Humidifer\nAir");
      bool isToggled =
          isHumidAir ? value.isHumidiferToggled : value.isPurifierToggled;

      return GestureDetector(
        onTap: () {
          isHumidAir
              ? value.toggleHumidiferSwitch()
              : value.togglePurifierSwitch();
        },
        child: Container(
          width: 60.0,
          height: 30.0,
          decoration: BoxDecoration(
            color: Color(isToggled ? 0xFFFFB267 : 0xff211D1D),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(5),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: isToggled ? 30.0 : 0.0,
                right: isToggled ? 0.0 : 30.0,
                top: -5,
                bottom: -5,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF282424),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
