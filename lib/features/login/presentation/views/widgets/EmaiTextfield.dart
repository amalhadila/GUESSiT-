import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/custom__text_field.dart';

class EmaiTextfield extends StatelessWidget {
  const EmaiTextfield({super.key, required this.onChanged});
  @override
    final void Function(String) onChanged;

  Widget build(BuildContext context) {
    return  CustomFormField(
       onChanged: onChanged,
      isobscure: false,
      hintText: 'your email',
      prefixIcon: Icons.email,
      keyboardType: TextInputType.emailAddress,
      
      validate: (value){
        if (value!.isEmpty){
          return 'field is required';
        } else if (!value.contains('@')){
          Fluttertoast.showToast(msg: 'Email is not vaild');
          return 'Email is not vaild';
        }
        return null;
      },

    );
  }
}