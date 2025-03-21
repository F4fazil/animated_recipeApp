import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedButton extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final AnimationController controller;
  final VoidCallback onCompleted;

  const GetStartedButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.controller,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.85,
          left: screenWidth * 0.1,
        ),
        child: GestureDetector(
          onTap: () {
            onCompleted();
          },
          child: Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                ),
              )
              .animate()
              .slideY(
                begin: 0.1,
                end: 0,
                delay: Duration(milliseconds: 2300),
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
              )
              .scaleXY(
                delay: Duration(milliseconds: 2300),
                begin: 0,
                end: 1,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
              ),
        ),
      ),
    );
  }
}
