import 'package:flutter/material.dart';
import 'package:lead_management/provider/lead_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => LeadProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.transparent),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
