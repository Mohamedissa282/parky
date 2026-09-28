import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mypost/colors.dart';

class TextformfieldWideget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  const TextformfieldWideget({super.key , required this.controller , required this.hintText, required this.prefixIcon,
     this.suffixIcon, required this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: ParkyColors.borderGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: ParkyColors.borderGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: ParkyColors.darkGreen),
        ),
      ),
    );
  }
}
