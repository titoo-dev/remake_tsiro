import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remake_tsiro/widget/recipe_form/multi_select_chip.dart';

class Form02 extends StatelessWidget {
  const Form02({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: ListTile(
            leading: const Icon(Icons.looks_two),
            title: Text(
              "Difficulté *",
              style: GoogleFonts.playfairDisplay(
                  fontSize: 22, color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Builder(builder: (context) {
            List<String> levelList = ["Facile", "Moyen", "Difficile"];
            return MultiSelectChip(
              levelList: levelList,
            );
          }),
        )
      ],
    );
  }
}
