import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.phone_android, "name": "Mobiles"},
      {"icon": Icons.headphones, "name": "Audio"},
      {"icon": Icons.chair, "name": "Furniture"},
      {"icon": Icons.lightbulb, "name": "Lighting"},
      {"icon": Icons.local_grocery_store, "name": "Grocery"},
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
                color: Color(0xFF40004D)),
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
              return Container(
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
                      color: Color(0xFFFF87E5),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      categories[index]["name"],
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF40004D)),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
