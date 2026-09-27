import 'package:flutter/material.dart';
import 'package:mypost/Widget/myButton.dart';
import 'package:mypost/colors.dart';

class Mycontainerwideget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onPressed;
  const Mycontainerwideget({super.key,required this.controller,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Ou avez-vous garé votre voiture ?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "ajoute une note si tu veux, puis enregistrer",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller:controller ,
                      decoration: InputDecoration(
                        hintText: "ex : Niveau 1, place 34",
                        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: ParkyColors.borderGrey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: ParkyColors.borderGrey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: ParkyColors.darkGreen,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Mybutton(text: "Enregistrer", onPressed:onPressed ),
                  ],
                ),
              ),
            );
  }
}