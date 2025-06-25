import 'package:flutter/material.dart';
import 'package:sgrodolix_native/models/search_model.dart';
import 'package:sgrodolix_native/viewmodels/song_viewmodel.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    final songInput = TextEditingController();
    final authorInput = TextEditingController();

    final songViewModel = SongViewModel(SearchModel());

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListenableBuilder(
            listenable: songViewModel,
            builder: (context, child) {
              return Column(
                children: [
                  if (songViewModel.errorMessage != null)
                    Text(
                      'Error: ${songViewModel.errorMessage}',
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.apply(color: Colors.red),
                    ),
                  if (songViewModel.data != null)
                    Text('${songViewModel.data!.title}, that\'s what i\'ve found'),
                ],
              );
            },
          ),
          RichText(
            text: TextSpan(
              style: texts.headlineMedium,
              children: <TextSpan>[
                TextSpan(text: 'Sgrodolix Native'),
                TextSpan(
                  text: '.',
                  style: texts.headlineMedium!.copyWith(color: colors.primary),
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
              TextFormField(
                controller: songInput,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inserisci Canzone Bene';
                  }
                  return null;
                },
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
              TextFormField(
                controller: authorInput,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inserisci Autore Bene';
                  }
                  return null;
                },
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  songViewModel.search(songInput.text, authorInput.text);
                }
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
    );
  }
}
