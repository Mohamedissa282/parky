import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypost/Widget/IconContainer.dart';
import 'package:mypost/Widget/myButton.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/generated/l10n.dart';
import 'package:mypost/pages/Authentification/connexion.dart';

class Forgotpasswordpage extends StatefulWidget {
  const Forgotpasswordpage({super.key});

  @override
  State<Forgotpasswordpage> createState() => _ForgotpasswordpageState();
}

class _ForgotpasswordpageState extends State<Forgotpasswordpage> {
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  bool estLoading = false;

  Future<void> resetPassword() async {
    try {
      setState(() {
        estLoading = true;
      });
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      setState(() {
        estLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            S.of(context).ChangePassword4,
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
        leading: Padding(
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
        title: Text(
          S.of(context).ChangePassword1,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 50),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               S.of(context).ChangePassword2,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),

              SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).PageConnexion5;
                  }

                  bool email = RegExp(
                    r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                  ).hasMatch(value);

                  if (!email) {
                    return S.of(context).PageConnexion15;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
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

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      resetPassword();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ParkyColors.darkGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: estLoading
                      ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                      : Text(
                          S.of(context).ChangePassword3,
                          style: TextStyle(
                            color: ParkyColors.limeGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
