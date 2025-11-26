import 'package:flutter/material.dart';
import 'package:flutter_application_1/pageproduct/page_audio.dart';
import 'package:flutter_application_1/pageproduct/page_furniture.dart';
import 'package:flutter_application_1/pageproduct/page_lighting.dart';
import 'package:flutter_application_1/pageproduct/page_mobile.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.phone_android, "name": "Mobiles"},
      {"icon": Icons.headphones, "name": "Audio"},
      {"icon": Icons.chair, "name": "Furniture"},
      {"icon": Icons.lightbulb, "name": "Lighting"},
      //  {"icon": Icons.local_grocery_store, "name": "Grocery"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Shop From Top Categories",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF40004D),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 110,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  {
                    String categoryName = categories[index]["name"];

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          if (categoryName == "Mobiles") {
                            return Page_mobile(categoryName: categoryName);
                          } else if (categoryName == "Audio") {
                            return PageAudio(categoryName: categoryName);
                          } else if (categoryName == "Furniture") {
                            return PageFurniture(categoryName: categoryName);
                          } else if (categoryName == "Lighting") {
                            return Page_lighting(categoryName: categoryName);
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    );
                  }
                  ;
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0xFFF3F3F3),
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        categories[index]["icon"],
                        color: const Color(0xFFFF87E5),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        categories[index]["name"],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF40004D),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
