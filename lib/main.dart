import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNqaXdlZ3hhYnBpZXhuYXpkb2NsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0NDcyNjAsImV4cCI6MjA3OTAyMzI2MH0.wKSY6xGXa-0qh_IhYeu7iXVEo_HFQE3Xe7QiM4cjnjw",
      url: "https://cjiwegxabpiexnazdocl.supabase.co");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
