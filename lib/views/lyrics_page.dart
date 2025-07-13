import 'package:flutter/material.dart';
import 'package:sgrodolix_native/models/search_model.dart';

class LyricsPage extends StatelessWidget {
  const LyricsPage({super.key, required this.data});

  final SongData data;

  @override
  Widget build(BuildContext context) {
    List<int> selectedLyrics = [];
    void updateSelectedLyrics(List<int> newSL) {
      selectedLyrics = newSL;
    }

    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "torna indietrol",
                  style: texts.displayMedium!.copyWith(color: colors.primary),
                ),
              ),
            ),
            Text(data.author, style: texts.labelSmall),
            Text(data.title, style: texts.headlineMedium),

            SizedBox(height: 16),

            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 300),
              child: Lyrics(
                lyrics: data.lyrics,
                callback: updateSelectedLyrics,
                colors: colors,
                texts: texts,
              ),
            ),

            SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  selectedLyrics.sort();
                  print(selectedLyrics);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fixedSize: const Size(double.infinity, 64),
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

class Lyrics extends StatefulWidget {
  const Lyrics({
    super.key,
    required this.lyrics,
    required this.texts,
    required this.colors,
    required this.callback,
  });

  final List<String> lyrics;
  final TextTheme texts;
  final ColorScheme colors;

  final ValueChanged<List<int>> callback;

  @override
  State<Lyrics> createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  List<int> selectedLyrics = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: widget.lyrics.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedLyrics.contains(index)
                  ? selectedLyrics.remove(index)
                  : selectedLyrics.add(index);
            });
            widget.callback(selectedLyrics);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
            child: Text(
              widget.lyrics[index],
              style: selectedLyrics.contains(index)
                  ? widget.texts.bodyMedium!.copyWith(
                      color: widget.colors.primary,
                      fontWeight: FontWeight.bold,
                    )
                  : widget.texts.bodyMedium,
            ),
          ),
        );
      },
    );
  }
}
