import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models_categories.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PageFurniture extends StatefulWidget {
  final String categoryName;
  const PageFurniture({super.key, required this.categoryName});

  @override
  State<PageFurniture> createState() => _PageFurnitureState();
}

class _PageFurnitureState extends State<PageFurniture> {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchfurniture() async {
    final response = await supabase.from('furniture').select();
    return List<Map<String, dynamic>>.from(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDDEDE),
      appBar: AppBar(
        title: Text(widget.categoryName),
        backgroundColor: Color(0xFF40004D),
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: fetchfurniture(),
        builder: (context, snapchot) {
          if (!snapchot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapchot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];

              return ModelsCategories(
                imageUrl: p["image_url"] ?? "",
                name: p["name"] ?? "",
                description: p["description"] ?? "",
                price: p["price"] ?? "",
                imageFit: BoxFit.cover,
              );
            },
          );
        },
      ),
    );
  }
}
