import 'package:animation_test/constant/utilities.dart';
import 'package:animation_test/src/home_widgets/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailFoodScreen extends StatefulWidget {
  final String name;
  final String image;
  final String calories;
  final String protein;

  const DetailFoodScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.calories,
    required this.protein,
  }) : super(key: key);

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  int _currentStep = 0;
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
      body: _buildUI(
        ScreenSize.getScreenWidth(context),
        ScreenSize.getScreenHeight(context),
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
      padding: EdgeInsets.only(
        top: screenHeight * 0.02,
        // left: screenWidth * 0.10,
      ),
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

  _buildUI(double screenWidth, double screenHeight) {
    return Stack(
      children: [
        _headerImage(screenWidth, screenHeight),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenSize.getScreenHeight(context) * 0.48,
          ),
          child: HorizontalList(),
        ),
        _detail(),
      ],
    );
  }

  _detail() {
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: ScreenSize.getScreenHeight(context) * 0.5,
          child: Stepper(
            currentStep: _currentStep,
            onStepTapped: (step) => setState(() => _currentStep = step),
            onStepContinue: () {
              if (_currentStep < 3) {
                setState(() => _currentStep += 1);
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() => _currentStep -= 1);
              }
            },
            steps: [
              Step(
                title: Text('Step 1'),
                content: Text('Content for Step 1'),
                isActive: _currentStep >= 0,
                state:
                    _currentStep > 0 ? StepState.complete : StepState.indexed,
              ),
              Step(
                title: Text('Step 2'),
                content: Text('Content for Step 2'),
                isActive: _currentStep >= 1,
                state:
                    _currentStep > 1 ? StepState.complete : StepState.indexed,
              ),
              Step(
                title: Text('Step 3'),
                content: Text('Content for Step 3'),
                isActive: _currentStep >= 2,
                state:
                    _currentStep > 2 ? StepState.complete : StepState.indexed,
              ),
              Step(
                title: Text('Step 4'),
                content: Text('Content for Step 4'),
                isActive: _currentStep >= 3,
                state:
                    _currentStep == 3 ? StepState.complete : StepState.indexed,
              ),
            ],
          ),
        );
      },
    );
  }
}
