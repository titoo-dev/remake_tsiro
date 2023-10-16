import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remake_tsiro/widget/page2/list_of_recent.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key : key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 110, left: 30),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Recent", 
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.w600
                ),   
              ),
            ),
            const ListOfRecent(),
          ],
        ),
      ),
    );
  }
}