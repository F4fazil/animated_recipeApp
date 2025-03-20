import 'dart:math';
import 'package:animation_test/onBoarding/button.dart';
import 'package:animation_test/view/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedTextPage extends StatefulWidget {
  const AnimatedTextPage({super.key});

  @override
  _AnimatedTextPageState createState() => _AnimatedTextPageState();
}

class _AnimatedTextPageState extends State<AnimatedTextPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildUI(screenWidth, screenHeight),
    );
  }

  Widget _buildUI(final screenWidth, final screenHeight) {
    return Stack(
      children: [
        _leavesImage1(screenWidth, screenHeight),
        _leavesImage2(screenWidth, screenHeight),
        _leavesImage3(screenWidth, screenHeight),
        _pepperImage(screenWidth, screenHeight),
        _riceImage(screenWidth, screenHeight),
        _animatedText(screenWidth, screenHeight),
        _descriptionText(screenWidth, screenHeight),
        GetStartedButton(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          controller: _controller,
          onCompleted: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _leavesImage1(final screenWidth, final screenHeight) {
    return Positioned(
          left: screenWidth * 0.09,
          top: screenHeight * 0.08,
          child: Transform.rotate(
            angle: 2 * pi * 0.85,
            child: Image.asset(
              "assets/images/leaves.png",
              height: screenHeight * 0.25,
            ),
          ),
        )
        .animate()
        .scaleXY(
          delay: Duration(milliseconds: 1500),
          begin: 0,
          end: 1,
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
        )
        .slide(begin: const Offset(0.7, -0.4), end: Offset.zero);
  }

  Widget _leavesImage2(final screenWidth, final screenHeight) {
    return Positioned(
          left: screenWidth * 0.09,
          top: screenHeight * 0.2,
          child: Transform.rotate(
            angle: 2 * pi * 0.2,
            child: Image.asset(
              "assets/images/leaves.png",
              height: screenHeight * 0.25,
            ),
          ),
        )
        .animate()
        .scaleXY(
          delay: Duration(milliseconds: 1500),
          begin: 0,
          end: 1,
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
        )
        .slide(begin: const Offset(0.7, -0.4), end: Offset.zero);
  }

  Widget _leavesImage3(final screenWidth, final screenHeight) {
    return Positioned(
          left: screenWidth * 0.09,
          top: screenHeight * 0.2,
          child: Transform.rotate(
            angle: 2 * pi * 1,
            child: Image.asset(
              "assets/images/leaves.png",
              height: screenHeight * 0.25,
            ),
          ),
        )
        .animate()
        .scaleXY(
          delay: Duration(milliseconds: 1500),
          begin: 0,
          end: 1,
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
        )
        .slide(begin: const Offset(0.7, -0.4), end: Offset.zero);
  }

  Widget _pepperImage(final screenWidth, final screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.5,
        top: screenHeight * 0.15,
      ),
      child: Container(
        width: screenWidth * 0.4,
        height: screenHeight * 0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/black_pepper.png'),
            fit: BoxFit.cover,
            alignment: Alignment(-2, 0),
          ),
        ),
      ).animate().slideX(
        begin: 1,
        end: 0,
        delay: 500.ms + 700.ms,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  Widget _riceImage(final screenWidth, final screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.01,
        top: screenHeight * 0.1,
      ),
      child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/rice.png'),
                fit: BoxFit.cover,
              ),
            ),
          )
          .animate()
          .slideX(
            begin: 0.1,
            end: 0,
            delay: 350.ms + 400.ms,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          )
          .scaleXY(
            begin: 0,
            end: 1,
            delay: 350.ms + 400.ms,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          ),
    );
  }

  Widget _animatedText(final screenWidth, final screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.5,
        left: screenWidth * 0.2,
      ),
      child: Text(
            "Find the Perfect\nrecipe everyday",
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: screenWidth * 0.08,
            ),
          )
          .animate()
          .slideY(
            begin: 0.1,
            end: 0,
            delay: 550.ms + 400.ms,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          )
          .scaleXY(
            delay: Duration(milliseconds: 1800),
            begin: 0,
            end: 1,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          ),
    );
  }

  Widget _descriptionText(final screenWidth, final screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.65,
        left: screenWidth * 0.2,
      ),
      child: Text(
            "More than 1 thousand recipes \nof healthy and delicious food.",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: screenWidth * 0.04,
            ),
          )
          .animate()
          .slideY(
            begin: 0.1,
            end: 0,
            delay: Duration(milliseconds: 2000),
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          )
          .scaleXY(
            delay: Duration(milliseconds: 1800),
            begin: 0,
            end: 1,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          ),
    );
  }
}
