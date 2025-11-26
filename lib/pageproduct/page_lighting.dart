import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models_categories.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Page_lighting extends StatefulWidget {
  final String categoryName;

  const Page_lighting({super.key, required this.categoryName});

  @override
  State<Page_lighting> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<Page_lighting> {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetclighting() async {
    final response = await supabase.from('lighting').select();

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
        future: fetclighting(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data!;

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
