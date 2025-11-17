import 'package:flutter/material.dart';
import 'package:flutter_application_1/CategoriesSection.dart';
import 'package:flutter_application_1/FooterSection.dart';
import 'package:flutter_application_1/HeroSection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDDEDE),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 60),
            HeroSection(),
            SizedBox(height: 40),
            CategoriesSection(),
            SizedBox(height: 40),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
