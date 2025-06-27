import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgrodolix_native/app_theme.dart';
import 'package:sgrodolix_native/viewmodels/song_viewmodel.dart';
import 'package:sgrodolix_native/views/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sgrodolix Native',
      theme: appTheme,
      home: ChangeNotifierProvider(
        create: (context) => SongViewModel(),
        child: const Main(),
      ),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchPage();
  }
}
