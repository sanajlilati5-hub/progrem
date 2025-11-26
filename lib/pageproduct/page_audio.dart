import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models_categories.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PageAudio extends StatefulWidget {
  final String categoryName;
  const PageAudio({super.key, required this.categoryName});

  @override
  State<PageAudio> createState() => _PageAudioState();
}

class _PageAudioState extends State<PageAudio> {
  final supabase = Supabase.instance.client;
  Future<List<Map<String, dynamic>>> fetchAudio() async {
    final response = await supabase.from("Audio").select();
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
          future: fetchAudio(),
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
                  imageFit: BoxFit.contain,
                );
              },
            );
          }),
    );
  }
}
