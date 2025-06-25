import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgrodolix_native/views/search_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF3D6ABD),
          onPrimary: Color(0xFFFFF8EE),
          secondary: Color(0xFFFFF8EE),
          onSecondary: Color(0xFF171717),
          error: Color(0xFFD5373A),
          onError: Color(0xFFFFF8EE),
          surface: Color(0xFF171717),
          onSurface: Color(0xFFFFF8EE),
        ),

        textTheme: TextTheme(
          headlineMedium: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(padding: const EdgeInsets.all(32), child: SearchForm()),
    );
  }
}

