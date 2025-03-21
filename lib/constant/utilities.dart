import 'package:flutter/material.dart';

class ScreenSize {
  // Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static TextStyle getFontStyle(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      color: const Color.fromARGB(255, 229, 186, 31),
    );
  }

  // Get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Get screen aspect ratio
  static double getScreenAspectRatio(BuildContext context) {
    return MediaQuery.of(context).size.aspectRatio;
  }

  // Get screen padding (e.g., status bar, notch, etc.)
  static EdgeInsets getScreenPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  // Get screen orientation
  static Orientation getScreenOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }
}
