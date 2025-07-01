import 'package:flutter/material.dart';

class LyricsPage extends StatelessWidget {
  const LyricsPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "torna indietrol",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
