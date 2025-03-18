import 'package:flutter/material.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/custom__text_field.dart';

class NameTextfield extends StatelessWidget {
  const NameTextfield({super.key, required this.onChanged});
  @override
    final void Function(String) onChanged;

  Widget build(BuildContext context) {
    return  CustomFormField(
      isobscure: false,
      onChanged: onChanged,
      hintText: 'your name',
      prefixIcon: Icons.person,
      keyboardType: TextInputType.name,
      
      validate: (value){
        if (value!.isEmpty){
          return 'field is required';
        } 
        return null;
      },

    );
  }
}