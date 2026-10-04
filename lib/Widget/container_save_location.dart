import 'package:flutter/material.dart';

class Containerpagesavelocation extends StatelessWidget {
  final Color? color;
  final Color? colorIcon;
  final IconData? icon;
  final String text;
  const Containerpagesavelocation({
    super.key,
    required this.color,
    required this.colorIcon,
    required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Icon(icon, color: colorIcon),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: colorIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
