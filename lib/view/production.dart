import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductionScreen extends StatelessWidget {
  final String title;
  const ProductionScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://cdn.pixabay.com/animation/2022/12/05/15/23/15-23-06-837_512.gif',
                width: 300,
                height: 300),
            Text(
              "$title Screen is in production now\nAvailable soon!",
              style: GoogleFonts.manrope(
                  color: Colors.white54,
                  fontWeight: FontWeight.w400,
                  height: 2),
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
