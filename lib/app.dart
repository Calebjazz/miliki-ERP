class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Miliki ERP',

      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
      ),

      darkTheme: ThemeData(
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
      ),

      themeMode: themeProvider.themeMode,

      initialRoute: '/',

      routes: {
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/signup': (_) => const SignUp(),
        '/dashboard': (_) => const DashboardPage(),
        '/settings': (_) => const SettingsPage(),
      },
    );
  }
}