import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/provider/home.dart';

class CustomSlider extends StatelessWidget {
  final bool mainLight;
  const CustomSlider({
    Key? key,
    required this.mainLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Consumer<HomeProvider>(
          builder: (context, value, child) {
            return SliderTheme(
              data: SliderThemeData(
                thumbColor: Colors.white,
                thumbShape: CustomSliderThumbShape(),
                trackHeight: 6.0,
                trackShape: CustomTrackShape(),
                activeTrackColor: const Color(0xffFFB267),
                inactiveTrackColor: const Color(0xff393637),
              ),
              child: Slider(
                value: mainLight
                    ? value.mainLightSliderVal
                    : value.floorLightSliderVal,
                // value: _value,
                min: 0.0,
                max: 10.0,
                onChanged: mainLight
                    ? value.setMainLightSliderVal
                    : value.setFloorLightSliderVal,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2.0;
    final double trackWidth = parentBox.size.width;
    final double trackBottom = trackTop + trackHeight;
    return Rect.fromLTRB(trackLeft, trackTop, trackWidth, trackBottom);
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(20.0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required Size sizeWithOverflow,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double textScaleFactor,
    required double value,
  }) {
    final Canvas canvas = context.canvas;

    // Outer circle
    const outerRadius = 16.0;
    final outerPaint = Paint()..color = const Color(0xFF6B6869);
    canvas.drawCircle(center, outerRadius, outerPaint);

    // Inner circle
    const innerRadius = outerRadius / 2.0;
    final innerPaint = Paint()..color = const Color(0xFFF8F8F8);
    canvas.drawCircle(center, innerRadius, innerPaint);
  }
}
