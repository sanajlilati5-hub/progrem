import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ModelsCategories extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final dynamic price;
  final BoxFit imageFit;

  const ModelsCategories(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.description,
      required this.price,
      required this.imageFit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: imageFit,
                  )
                : Container(
                    height: 160,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 40),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF40004D),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Text(
              description,
              softWrap: true,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFA8A8A8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "\$$price",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF87E5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
