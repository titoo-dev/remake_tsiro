import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:remake_tsiro/view/user_profil.dart';

class CustomEndDrawer extends StatefulWidget {
  const CustomEndDrawer({super.key});

  @override
  State<CustomEndDrawer> createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.black87
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 200,
                  color: Colors.white70,
                  child: const Center(
                    child: Icon(Icons.restaurant_menu, color: Colors.black87, size: 50,),
                  ),
                ),
                const SizedBox(height: 50,),
                ListTile(
                  onTap: (){

                  },
                  leading: const Icon(Icons.home,color: Colors.white),
                  title: const Text("Accueil", style: TextStyle(color: Colors.white),),
                ),
                const ListTile(leading: Icon(Icons.timelapse, color: Colors.white),
                  title: Text("Recent", style: TextStyle(color: Colors.white),),
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation){
                          return const Profil();
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child){
                          var begin = const Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;
                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        }
                      )
                    );
                  },
                  leading: const Icon(Icons.person, color: Colors.white),
                  title: const Text("Profil", style: TextStyle(color: Colors.white),),
                ),
                const ListTile(leading: Icon(Icons.exit_to_app, color: Colors.white),
                  title: Text("Déconnection", style: TextStyle(color: Colors.white),),
                ),
                
              ],
            ),

            const Positioned(
              top: 160,
              left: 60,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black87,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: FlutterLogo(
                    size: 30,
                    style: FlutterLogoStyle.stacked,
                  ),
                ),
              ))
          ],
        ),
      ),
    );
  }
}