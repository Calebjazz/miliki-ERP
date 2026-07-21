import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Ensure Flutter engine bindings are ready for async native code
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase configuration
  await Supabase.initialize(
    url: 'https://krvmtozwlynvkraunjzu.supabase.co',
    publishableKey: 'sb_publishable_O2Qp3XwaIcbatTmAvACjYw_e7gCWTNh',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miliki ERP',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        body: Center(child: Text('Supabase Initialized Cleanly!')),
      ),
    );
  }
}
