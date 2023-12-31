import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Form03 extends StatelessWidget {
  const Form03({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 180),
        child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      leading: const Icon(Icons.looks_3),
                      title: Text("Decrit ta recette",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 22,
                          color: Colors.black87
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 72, right: 20),
                    child: SizedBox(
                      height: 250,
                      child: TextField(
                        cursorColor: Colors.black87,
                        maxLines: 8,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w300
                        ),
                        decoration: InputDecoration(
                          hintText: "Description\nici ...",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w300
                          )
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}