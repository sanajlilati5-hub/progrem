import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: screenHeight,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF85A3), Color(0xff264c76)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "MegaMart",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            "Your best online store for electronics and essentials.",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 22),
          const Text(
            "About Us   |   Contact   |   Privacy Policy   |   Support",
            style: TextStyle(color: Colors.white60, fontSize: 12),
          ),
          const SizedBox(height: 20),
          const Text(
            "© 2024 MegaMart. All Rights Reserved.",
            style: TextStyle(color: Colors.white38, fontSize: 12),
          )
        ],
      ),
    );
  }
}
