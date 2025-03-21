import 'dart:async';

import 'package:animation_test/constant/utilities.dart';
import 'package:animation_test/src/home_widgets/horizontal_list.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DetailFoodScreen extends StatefulWidget {
  final String name;
  final String image;
  final String calories;
  final String protein;

  const DetailFoodScreen({
    super.key,
    required this.name,
    required this.image,
    required this.calories,
    required this.protein,
  });

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  int _activeStep = 0;
  List<bool> _completedSteps = [false, false, false, false];
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: _animatedText(
          ScreenSize.getScreenWidth(context),
          ScreenSize.getScreenHeight(context),
        ),
      ),
      body: Stack(
        children: [
          _buildUI(
            ScreenSize.getScreenWidth(context),
            ScreenSize.getScreenHeight(context),
          ),
        ],
      ),
    );
  }

  Widget _headerImage(final screenWidth, final screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.10,
        top: screenHeight * 0.015,
      ),
      child: Container(
            width: screenWidth * 0.8,
            height: screenHeight * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.contain,
              ),
            ),
          )
          .animate()
          .slideX(
            begin: 0.1,
            end: 0,
            delay: 200.ms + 200.ms,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          )
          .scaleXY(
            begin: 0,
            end: 1,
            delay: 200.ms + 200.ms,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          ),
    );
  }

  Widget _animatedText(final screenWidth, final screenHeight) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.02),
      child: Text(
            widget.name,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: screenWidth * 0.08,
            ),
          )
          .animate()
          .slideY(
            begin: 0.1,
            end: 0,
            delay: 550.ms + 250.ms,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          )
          .scaleXY(
            delay: 550.ms + 250.ms,
            begin: 0,
            end: 1,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          ),
    );
  }

  Widget _buildUI(double screenWidth, double screenHeight) {
    return Stack(
      children: [
        _headerImage(screenWidth, screenHeight),
        _detail(),
        _bottomsheet(),
      ],
    );
  }

  Widget _detail() {
    return Padding(
      padding: EdgeInsets.only(top: ScreenSize.getScreenHeight(context) * 0.4),
      child: Opacity(
        opacity: 0.8,
        child: Padding(
          padding: EdgeInsets.only(
            left: ScreenSize.getScreenWidth(context) * 0.10,
          ),
          child: Container(
            width: ScreenSize.getScreenWidth(context) * 0.8,
            height: ScreenSize.getScreenHeight(context) * 0.07,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.2),
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.calories,
                          style: ScreenSize.getFontStyle(context),
                        ),
                        Text(
                          widget.protein,
                          style: ScreenSize.getFontStyle(context),
                        ),
                        Text("60 min", style: ScreenSize.getFontStyle(context)),
                      ],
                    ),
                  ],
                )
                .animate()
                .scaleXY(
                  begin: 0,
                  end: 1,
                  delay: 1100.ms,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                )
                .slide(
                  begin: Offset(0.0, 1.0),
                  end: Offset.zero,
                  delay: 1100.ms,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                ),
          ),
        ),
      ),
    );
  }

  Widget _bottomsheet() {
    return DraggableScrollableSheet(
      controller: _scrollController,
      initialChildSize: 0.45, // 30% of screen height initially
      minChildSize: 0.45, // Minimum 30% of screen height
      maxChildSize: 0.8, // Expands up to 80% of screen height
      builder: (context, scrollController) {
        return Opacity(
          opacity: 0.9,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drag handle indicator
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Ingredients",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: ScreenSize.getScreenHeight(context) * 0.015,
                      ),
                      child: HorizontalList(),
                    ),
                    // Stepper
                    buildVerticalStepper(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildVerticalStepper() {
    return Row(
      children: [
        EasyStepper(
          direction: Axis.vertical,
          activeStep: _activeStep,
          stepRadius: 10,
          steps: List.generate(4, (index) {
            return EasyStep(
              icon: Icon(Icons.check),
              finishIcon:
                  _completedSteps[index]
                      ? Icon(Icons.check_circle)
                      : Icon(Icons.check),
              title: 'Step ${index + 1}',
            );
          }),
          onStepReached: (index) {
            setState(() {
              // Mark the selected step as completed
              _completedSteps[index] = true;
              _activeStep = index;

              // Show Lottie animation only when Step 4 is tapped
            });
            if (index == 3) {
              Lottieloading(context);
              // Pass context when calling the function
            }
          },
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_activeStep == 0) ...[
              Text('Step 1', style: ScreenSize.getFontStyle(context)),
              Text(
                'Wash the ingredients',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
            if (_activeStep == 1) ...[
              Text('Step 2', style: ScreenSize.getFontStyle(context)),
              Text(
                'Chop the ingredients',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
            if (_activeStep == 2) ...[
              Text('Step 3', style: ScreenSize.getFontStyle(context)),
              Text(
                'Cook the ingredients',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
            if (_activeStep == 3) ...[
              Text('Step 4', style: ScreenSize.getFontStyle(context)),
              Text(
                'Serve the dish',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ],
        ),
      ],
    );
  }

  void Lottieloading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Lottie.asset(
            'assets/images/congrats.json', // Ensure the correct file path
            width: 200,
            height: 200,
            repeat: true,
            animate: true,
          ),
        );
      },
    );

    // Wait for 3 seconds and then close the dialog and minimize the bottom sheet
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop(); // Close the Lottie dialog
      _scrollController.animateTo(
        0.45, // Minimize to initial position
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
}
