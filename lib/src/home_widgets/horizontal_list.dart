import 'package:animation_test/constant/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalList extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'emoji': '🍔', 'text': 'Burger'},
    {'emoji': '🍕', 'text': 'Pizza'},
    {'emoji': '🍣', 'text': 'Sushi'},
    {'emoji': '🍩', 'text': 'Donut'},
    {'emoji': '🍎', 'text': 'Apple'},
  ];

  HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: SizedBox(
        height: ScreenSize.getScreenHeight(context) * 0.07,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                    width: ScreenSize.getScreenWidth(context) * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          items[index]['emoji']!,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(width: 8),
                        Text(
                          items[index]['text']!,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                  .animate() // Apply animations to each item
                  .slide(
                    begin: Offset(1.0, 0.0), // Start from the right side
                    end: Offset.zero, // Move to original position
                    delay: (index * 500).ms, // Delay based on index
                    duration: 500.ms,
                    curve: Curves.easeInOutCubic,
                  )
                  .scaleXY(
                    begin: 0, // Start from size 0
                    end: 1, // Scale to original size
                    delay: (index * 500).ms, // Delay based on index
                    duration: 500.ms,
                    curve: Curves.easeInOutCubic,
                  ),
            );
          },
        ),
      ),
    );
  }
}
