import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Form05 extends StatelessWidget {
  const Form05({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text("Pour combien de personne ?",
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                color: Colors.black87
              ),
            ),
          ),
        ),
        const SizedBox(height: 60,),
        Padding(
          padding: const EdgeInsets.only(left: 72, right: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 120,
                  height: 50,
                  child: TextField(

                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black87,
                    maxLength: 2,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300

                    ),
                    decoration: InputDecoration(
                      hintText: "min",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w300
                      )
                    ),
                  ),
                ),

                const SizedBox(height: 30,),

                SizedBox(
                  width: 120,
                  height: 50,
                  child: TextField(

                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black87,
                    maxLength: 2,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300

                    ),
                    decoration: InputDecoration(
                      hintText: "max",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w300
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}