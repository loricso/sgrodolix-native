import 'package:flutter/material.dart';
import 'package:sgrodolix_native/viewmodels/song_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sgrodolix_native/views/input_with_label.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(padding: const EdgeInsets.all(32), child: SearchForm()),
    );
  }
}

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

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SongViewModel>(
            builder: (context, vm, child) => Column(
              children: [
                if (vm.errorMessage != null)
                  Text(
                    'Error: ${vm.errorMessage}',
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.apply(color: Colors.red),
                  ),
              ],
            ),
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

          InputWithLabel(
            controller: songInput,
            label: "Canzone",
            placeholder: "basta",
          ),

          SizedBox(height: 16),

          InputWithLabel(
            label: "Autore",
            placeholder: "prima stanza a destra",
            controller: authorInput,
          ),

          SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var data = await Provider.of<SongViewModel>(
                    context,
                    listen: false,
                  ).search(songInput.text, authorInput.text);
                  if (data != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Placeholder(),
                      ),
                    );
                  }
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
