import 'package:flutter/material.dart';
import 'package:sgrodolix_native/viewmodels/song_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sgrodolix_native/views/input_with_label.dart';
import 'package:sgrodolix_native/views/lyrics_page.dart';

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
  bool _navigated = false;

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
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 100),
            child: Consumer<SongViewModel>(
              builder: (context, vm, child) {
                if (vm.data != null && !vm.isLoading && !_navigated) {
                  _navigated = true;

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LyricsPage(title: vm.data!.title),
                      ),
                    ).then((_) {
                      _navigated = false;
                    });
                  });
                }

                if (vm.errorMessage == null) {
                  return SizedBox(height: 0, width: 0);
                }

                return Text(
                  'Error: ${vm.errorMessage}',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.apply(color: Colors.red),
                );
              },
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
            child: Consumer<SongViewModel>(
              builder: (context, vm, child) {
                return ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() && !vm.isLoading) {
                      vm.search(songInput.text, authorInput.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(double.infinity, 64),
                  ),
                  child: vm.isLoading
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              colors.onPrimary,
                            ),
                          ),
                        )
                      : Text(
                          "Cerca al Volo",
                          style: texts.displayMedium!.copyWith(
                            color: colors.onPrimary,
                          ),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
