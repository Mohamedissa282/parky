import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Center(
      child: LoadingAnimationWidget.twoRotatingArc(
        color: Colors.white,
        size: 200,
      ),
    ),
    );
  }
}