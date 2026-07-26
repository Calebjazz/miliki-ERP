import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Load the environment file first
  await dotenv.load(fileName: ".env");

  // 2. Initialize Supabase by pulling the values dynamically
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    publishableKey: dotenv.env['SUPABASE_PUBLISHABLE_KEY'] ?? '',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Miliki ERP',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Miliki ERP',
            style: const TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 110, 202, 5),
        ),
      ),
    );
  }
}
