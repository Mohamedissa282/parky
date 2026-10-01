import 'package:flutter/material.dart';
import 'package:mypost/Widget/IconContainer.dart';
import 'package:mypost/colors.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ParkyColors.darkGreen,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Iconcontainer(
                color: ParkyColors.darkGreen,
                icon: Icons.arrow_back,
                iconColor: ParkyColors.limeGreen,
              ),
            ),
        
            Text("Paramètres", style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15
            ),),
           
              ],
            ),
             SizedBox(height: 50,),
            Column(children: [
              CircleAvatar(
                backgroundColor: ParkyColors.limeGreen,
                child: Text("MI", style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15
            ),),
            
              ),
               SizedBox(height: 8,),
              Text("Mohamed Issa", style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15
            ),),
             SizedBox(height: 8,),
            Text("mohamed@gmail.com", style: TextStyle(
              color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 13
            ),)
            ],),
            SizedBox(height: 25,),
            Expanded(
              
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(17), topRight: Radius.circular(17) )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                    Text("LANGUE", style: TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15
                              ),),
               SizedBox(height: 180,),
                               Row(
                              children: [
                                Icon(Icons.logout, color: Colors.red[800]),
                                SizedBox(width: 8),
                                Text(
                                  "Se déconnecter",
                                  style: TextStyle(
                                    color: Colors.red[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                  ],),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}