import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypost/Widget/IconContainer.dart';
import 'package:mypost/Widget/myButton.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/pages/Authentification/connexion.dart';

class Forgotpasswordpage extends StatefulWidget {
  const Forgotpasswordpage({super.key});

  @override
  State<Forgotpasswordpage> createState() => _ForgotpasswordpageState();
}

class _ForgotpasswordpageState extends State<Forgotpasswordpage> {
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Email envoyé ! Vérifie ta boîte mail",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      );
await Future.delayed(Duration(seconds: 2));
       Navigator.of(context).pushReplacement(
        (MaterialPageRoute(builder: (context) => ConnexionPage())),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erreur : $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ParkyColors.background,
      appBar: AppBar(
        backgroundColor: ParkyColors.background,
        leading:  Padding(
          padding: const EdgeInsets.all(11.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Iconcontainer(
              color: ParkyColors.darkGreen,
              icon: Icons.arrow_back,
              iconColor: ParkyColors.limeGreen,
            ),
          ),
        ),
        title: Text("Mot de passe oublié",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
        
        
        )),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 50),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "ajoutez votre email";
                  }

                  bool email = RegExp(
                    r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                  ).hasMatch(value);

                  if (!email) {
                    return "Email non valide";
                  }
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
              ),
              SizedBox(height: 20),

              Mybutton(text: "Réinitialiser le mot de passe", onPressed: (){
                 if (_key.currentState!.validate()) {
                    resetPassword();
                   
                    //Navigator.of(context).pop();
                  }
              })
              
            ],
          ),
        ),
      ),
    );
  }
}
