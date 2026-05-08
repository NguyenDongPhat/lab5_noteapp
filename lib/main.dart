import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/note_provider.dart';
import 'screens/home_page.dart';

final GlobalKey<ScaffoldMessengerState> globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFFFFB703);
    const backgroundColor = Color(0xFFFFFBF2);

    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        title: 'Simple Note App',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: globalMessengerKey,
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: seedColor, surface: backgroundColor),
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: seedColor,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            elevation: 3,
            shadowColor: Colors.black45,
            toolbarHeight: 56,
            titleTextStyle: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: seedColor,
            foregroundColor: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          cardTheme: CardThemeData(
            color: Colors.white,
            elevation: 1,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: seedColor.withValues(alpha: 0.2), width: 1),
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}