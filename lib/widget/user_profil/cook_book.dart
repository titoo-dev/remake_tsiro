import 'package:flutter/material.dart';
import 'package:remake_tsiro/view/recipe_more_info.dart';

class CookBook extends StatefulWidget {
  final String id;
  final String imagePath;
  final String title;
  const CookBook({super.key, required this.id, required this.imagePath, required this.title});

  @override
  State<CookBook> createState() => _CookBookState();
}

class _CookBookState extends State<CookBook> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return InfoPage(id: widget.id, image: widget.imagePath,);
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8, top: 5), 
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Hero(
                tag: widget.id,
                child: Image.asset(widget.imagePath, fit: BoxFit.cover,)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.title, 
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                      )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("9 avis", 
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black38
                      )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}