import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remake_tsiro/widget/user_profil/custom_tab_view.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.1, left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.2,
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(6, 12),
                              blurRadius: 8,
                            )
                          ]),
                          child: InkWell(
                            onTap: _pickImageFromGallery,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              child: CircleAvatar(
                                backgroundImage: _image == null
                                    ? const AssetImage(
                                        "assets/images/recipe_01.jpg")
                                    : FileImage(_image!) as ImageProvider,
                                radius: 47,
                                backgroundColor: Colors.grey[200],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: SizedBox(
                            width: 202,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Titosy Manankasina",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Cuisinier",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: height * 0.12,
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 2,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "353",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Recipes",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "12K",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Views",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "1.4K",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const MyCustomTabView(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.more_horiz),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _pickImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }
}
