import 'package:animation_test/constant/utilities.dart';
import 'package:animation_test/src/home_widgets/horizontal_list.dart';
import 'package:animation_test/src/home_widgets/vertical_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

      body: Column(
        children: [
          _header(),
          _horizontalItemList(),
          _verticalItemList(),
          SizedBox(height: ScreenSize.getScreenHeight(context) * 0.03),
        ],
      ),
    );
  }

  _horizontalItemList() {
    return Padding(padding: const EdgeInsets.all(8.0), child: HorizontalList());
  }

  _verticalItemList() {
    return Expanded(child: VerticalList());
  }

  _header() {
    return SizedBox(
      height: ScreenSize.getScreenHeight(context) * 0.22,
      width: ScreenSize.getScreenWidth(context),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 9.0,
              right: 8,
              top: ScreenSize.getScreenHeight(context) * 0.055,
            ),
            child: Text(
                  ' Hello,\n Users 👋',
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
                .animate()
                .scaleXY(
                  delay: Duration(milliseconds: 500),
                  begin: 0,
                  end: 1,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                )
                .slide(begin: const Offset(0.7, -0.4), end: Offset.zero),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 9.0,
              right: 8,
              top: ScreenSize.getScreenHeight(context) * 0.055,
            ),
            child: CircleAvatar(
                  maxRadius: 50,
                  child: Image.asset(
                    'assets/images/profile_image.png',
                    width: 100,
                    height: 100,
                  ),
                )
                .animate()
                .scaleXY(
                  delay: Duration(milliseconds: 500),
                  begin: 0,
                  end: 1,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                )
                .slide(begin: const Offset(-1, 0.0), end: Offset.zero),
          ),
        ],
      ),
    );
  }
}
