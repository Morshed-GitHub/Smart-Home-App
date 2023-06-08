import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/view/home.dart';

import '../provider/search.dart';
import '../utils/utils.dart';

class DeviceGridItem extends StatelessWidget {
  final Color? bgColor;
  final Color? funcTextColor;
  final String img;
  final double? imgHeight;
  final String title;
  final String function;

  const DeviceGridItem({
    super.key,
    this.bgColor,
    required this.img,
    required this.title,
    required this.function,
    this.funcTextColor,
    this.imgHeight,
  });

  @override
  Widget build(BuildContext context) {
    final halfScreen = context.scrWidth * .5; // 50 percent of screen width

    return Consumer<SearchProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            value.toggleSelection(title: title);
          },
          child: Container(
            height: context.scrHeight * .27, // 27 percent of screen height
            width: (halfScreen -
                Utils.restrictArea), // Used for padding (Outside + In-between)

            decoration: deviceGridItemDecoration(value),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: deviceItemInfo(),
            ),
          ),
        );
      },
    );
  }

  Column deviceItemInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image
        Image.asset("assets/images/$img.png", height: imgHeight ?? 70),
        const SizedBox(height: 10),

        // Title
        Text(
          title,
          style: GoogleFonts.manrope(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),

        // Function
        Utils.mediumText(
            color: funcTextColor ?? Colors.white54,
            title: function,
            fontsize: 13),
      ],
    );
  }

  BoxDecoration deviceGridItemDecoration(SearchProvider provider) {
    return BoxDecoration(
      color: bgColor ?? const Color(0xff282424),
      borderRadius: BorderRadius.circular(24),
      border: (provider.isTapped &&
              img != "Manual" &&
              provider.selectedDevice ==
                  title) // Golden outlined effect when tapped
          ? const Border.fromBorderSide(BorderSide(color: Color(0xffFFB267)))
          : null,
    );
  }
}
