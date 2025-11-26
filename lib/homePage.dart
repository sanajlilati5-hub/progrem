import 'package:flutter/material.dart';
import 'package:flutter_application_1/CategoriesSection.dart';
import 'package:flutter_application_1/FooterSection.dart';
import 'package:flutter_application_1/HeroSection.dart';
import 'package:flutter_application_1/search.dart';

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
            SizedBox(height: 30),
            Search(),
            SizedBox(height: 20),
            HeroSection(),
            SizedBox(height: 20),
            CategoriesSection(),
            SizedBox(height: 40),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
