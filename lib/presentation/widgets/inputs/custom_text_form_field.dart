import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  const CustomTextFormField({super.key});


  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      onChanged: (value) {
        print('value: $value');
      },
      validator: (value) {
        return 'Error en el';
      },
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
      ),
    );
  }
}