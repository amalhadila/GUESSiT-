import 'package:flutter/material.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/custom__text_field.dart';

class PhoneTextfield extends StatelessWidget {
  const PhoneTextfield({super.key, required this.onChanged});
  @override
    final void Function(String) onChanged;

  Widget build(BuildContext context) {
    return  CustomFormField(
      isobscure: false,
      onChanged: onChanged,
      hintText: 'your phone',
      keyboardType: TextInputType.phone,
      
      validate: (value){
        if (value!.isEmpty){
          return 'field is required';
        } 
        return null;
      },
    );
  }
}