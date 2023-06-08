import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_app/view/home.dart';

class ActionButton extends StatelessWidget {
  final String title;
  const ActionButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      width: context.scrWidth,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffFFB267),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        title,
        style: GoogleFonts.manrope(
          color: const Color(0xff211D1D),
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
