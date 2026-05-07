import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/note_provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        title: 'Simple Note App',
        debugShowCheckedModeBanner: false, 
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlue, 
          ),
          scaffoldBackgroundColor: const Color(0xFFF5FAFF), 
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.lightBlue, 
            foregroundColor: Colors.white,     
            centerTitle: true,                 
            elevation: 2,
            shadowColor: Colors.black26,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.orangeAccent, 
            foregroundColor: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)), 
            ),
          ),
          cardTheme: CardThemeData(
            color: Colors.white,
            elevation: 2,
            shadowColor: Colors.blue.withValues(alpha: 0.15), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), 
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}