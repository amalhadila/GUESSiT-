import 'package:flutter/material.dart';
import 'package:guessit_task/core/theme/color_app.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key,required this.isobscure,  this.prefixIcon,required this.hintText,  this.suffixIcon, this.onPressed, required this.keyboardType,  this.onChanged, required this.validate, this.Controller});
  final bool isobscure;
  final TextEditingController? Controller;
  final String hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final void Function()? onPressed;
  final TextInputType keyboardType;
  final void Function(String)?  onChanged;
  final String? Function(String?)  validate;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: isobscure,
      controller:Controller ,
      decoration: InputDecoration(
        
        hintText: hintText,
        suffixIcon: suffixIcon !=null? IconButton(onPressed: onPressed, icon: Icon(suffixIcon)): null,
        prefixIcon: suffixIcon !=null? IconButton(onPressed: onPressed, icon: Icon(prefixIcon)): null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorApp.primaryColor,width: 2)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorApp.primaryColor,width: 2)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorApp.primaryColor,width: 2)
        ),        
      ),
      style: const TextStyle(fontSize: 14),
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validate,
    );
  }
}