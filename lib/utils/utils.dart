import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static const restrictArea = 30;
  static Widget regularText12({required String title}) {
    return Text(
      title,
      style: GoogleFonts.manrope(
        color: Colors.white54,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static Widget mediumText(
      {required String title, required Color color, required double fontsize}) {
    return Text(
      title,
      style: GoogleFonts.manrope(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static Widget semiBoldText(
      {required String title, required Color color, required double fontsize}) {
    return Text(
      title,
      style: GoogleFonts.manrope(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Widget showIcon({required String icon}) {
    return Image.asset("assets/images/$icon.png", height: 28, width: 28);
  }
}
