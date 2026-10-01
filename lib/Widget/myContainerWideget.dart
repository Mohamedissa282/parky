import 'package:flutter/material.dart';
import 'package:mypost/Widget/myButton.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/pages/photoStatusRow.dart';

class Mycontainerwideget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onPressed;
  final  bool hasPhoto;
  final void Function() onPickPhoto;
  final void Function() onRemovePhoto;
  const Mycontainerwideget({super.key,required this.controller,required this.onPressed, required this.hasPhoto, required this.onPickPhoto, required this.onRemovePhoto});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Ajoutez une photo et note si vous voulez, puis enregistre.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 8),
                    
                    PhotoStatusRow(hasPhoto: hasPhoto, onPickPhoto: onPickPhoto, onRemovePhoto: onRemovePhoto),
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