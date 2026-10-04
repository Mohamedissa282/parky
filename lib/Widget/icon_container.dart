import 'package:flutter/material.dart';

class Iconcontainer extends StatelessWidget {
  final Color? color;
  final Color? iconColor;
  final IconData? icon;
  const Iconcontainer({super.key,required this.color,required this.icon,required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child:  Icon(
                      icon,
                      color: iconColor,
                      size: 28,
                    ),
                  );
  }
}