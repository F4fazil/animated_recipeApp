import 'package:animation_test/constant/utilities.dart';
import 'package:animation_test/view/detailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalList extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/burger.png',
      'name': 'Burger',
      'description': 'A delicious burger with cheese and lettuce.',
      'calories': '250 kcal',
      'protein': '15g protein',
    },
    {
      'image': 'assets/images/pizza.png',
      'name': 'Pizza',
      'description': 'A tasty pizza with pepperoni and cheese.',
      'calories': '300 kcal',
      'protein': '20g protein',
    },
    {
      'image': 'assets/images/spaghetti.png',
      'name': 'spaghetti',
      'description': 'Fresh spaghetti with salmon and avocado.',
      'calories': '200 kcal',
      'protein': '10g protein',
    },
    {
      'image': 'assets/images/salad.png',
      'name': 'Salad',
      'description': 'A healthy salad with mixed greens and tomatoes.',
      'calories': '150 kcal',
      'protein': '5g protein',
    },
  ];

  VerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Opacity(
            opacity: 0.8,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => DetailFoodScreen(
                          name: items[index]["name"]!,
                          image: items[index]["image"]!,
                          calories: items[index]["calories"]!,
                          protein: items[index]["protein"]!,
                        ),
                  ),
                );
              },
              child: Container(
                width: ScreenSize.getScreenWidth(context) * 0.9,
                height: ScreenSize.getScreenHeight(context) * 0.3,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenSize.getScreenHeight(context) * 0.05,
                            left: ScreenSize.getScreenWidth(context) * 0.035,
                          ),
                          child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  items[index]['image']!,
                                  width:
                                      ScreenSize.getScreenWidth(context) * 0.45,
                                  height:
                                      ScreenSize.getScreenWidth(context) * 0.35,
                                  fit: BoxFit.contain,
                                ),
                              )
                              .animate()
                              .slideX(
                                begin: 0.1,
                                end: 0,
                                // delay: 350.ms + 400.ms,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOutCubic,
                              )
                              .scaleXY(
                                begin: 0,
                                end: 1,
                                // delay: 350.ms + 400.ms,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOutCubic,
                              ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: ScreenSize.getScreenHeight(context) * 0.055,
                              left: ScreenSize.getScreenWidth(context) * 0.05,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${items[index]['calories']} • ${items[index]['protein']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: const Color.fromARGB(
                                      255,
                                      229,
                                      186,
                                      31,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14),
                                Text(
                                  items[index]['name']!,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Flexible(
                                  child: Text(
                                    items[index]['description']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: const Color.fromARGB(
                                        255,
                                        154,
                                        152,
                                        152,
                                      ),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                    .animate()
                    .slideX(
                      begin: 0.1,
                      end: 0,
                      // delay: 350.ms + 400.ms,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutCubic,
                    )
                    .scaleXY(
                      begin: 0,
                      end: 1,
                      // delay: 350.ms + 400.ms,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutCubic,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
