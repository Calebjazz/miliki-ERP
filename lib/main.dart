import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/splash/presentation/splash_page.dart';
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
      theme: ThemeData(
      textTheme: GoogleFonts.urbanistTextTheme(Theme.of(context).textTheme),
      primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {'/': (context) => const SplashPage()},
    );
  }
}
