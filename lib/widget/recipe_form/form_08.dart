import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Form08 extends StatefulWidget {
  const Form08({super.key});

  @override
  State<Form08> createState() => _Form08State();
}

class _Form08State extends State<Form08> {

  File? _image;

  void _pickImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Finalisation :)",
              style: GoogleFonts.playfairDisplay(
                fontSize: 28
              ),
            ),
          ),
        ),

        const SizedBox(height: 22,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _image == null ? const AssetImage("assets/image/recette.jpg") : FileImage(_image!) as ImageProvider, 
                fit: BoxFit.cover
              ),
            ),
            height: 250,
            child: (_image == null) ? Center(
              child: InkWell(
                onTap: (){
                  _pickImageFromGallery();
                },
                child: const Chip(
                  elevation: 5,
                  padding: EdgeInsets.all(10),
                  label: Text("Ajouter une Image")),
              ),
            ) : Container(),
          ),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
                ),
                onPressed: (){},
                child: const Text("Confirmer l'envoie du formulaire"),
              )
            ],
          ),
        )
      ],
    );
  }
}