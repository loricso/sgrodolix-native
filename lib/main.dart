import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            fontWeight: FontWeight.bold,
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
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: texts.headlineMedium,
                children: <TextSpan>[
                  TextSpan(text: 'Sgrodolix Native'),
                  TextSpan(
                    text: '.',
                    style: texts.headlineMedium!.copyWith(
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 4),
                  child: Text("Canzone", style: texts.labelSmall),
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    filled: true,
                    fillColor: colors.secondary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'basta',
                    hintStyle: texts.bodyMedium!.copyWith(
                      color: colors.onSecondary.withValues(alpha: 0.8),
                    ),
                  ),
                  style: texts.bodyMedium!.copyWith(color: colors.onSecondary),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 4),
                  child: Text("Autore", style: texts.labelSmall),
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    filled: true,
                    fillColor: colors.secondary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'primastanzaadestra',
                    hintStyle: texts.bodyMedium!.copyWith(
                      color: colors.onSecondary.withValues(alpha: 0.8),
                    ),
                  ),
                  style: texts.bodyMedium!.copyWith(color: colors.onSecondary),
                ),
              ],
            ),
            SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Bordi arrotondati
                  ),
                  fixedSize: const Size(
                    double.infinity,
                    64,
                  ), // Bottone quadrato
                ),
                child: Text(
                  "Cerca al Volo",
                  style: texts.displayMedium!.copyWith(color: colors.onPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
