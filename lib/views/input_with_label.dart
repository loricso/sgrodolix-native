import 'package:flutter/material.dart';

class InputWithLabel extends StatelessWidget {
  const InputWithLabel({
    super.key,
    required this.controller,
    required this.label,
    required this.placeholder,
  });

  final TextEditingController controller;
  final String label;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 2),
          child: Text(label, style: texts.labelSmall),
        ),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Non puo rimanere vuotol';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
            filled: true,
            fillColor: colors.secondary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none,
            ),
            hintText: placeholder,
            hintStyle: texts.bodyMedium!.copyWith(
              color: colors.onSecondary.withValues(alpha: 0.8),
            ),

            errorStyle: texts.labelSmall!.copyWith(color: colors.error),
          ),
          style: texts.bodyMedium!.copyWith(color: colors.onSecondary),
        ),
      ],
    );
  }
}
