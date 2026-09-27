import 'package:flutter/material.dart';
import 'package:mypost/colors.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Mybutton({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return // Bouton Se connecter
    SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed ,
        style: ElevatedButton.styleFrom(
          backgroundColor: ParkyColors.darkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: ParkyColors.limeGreen,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
