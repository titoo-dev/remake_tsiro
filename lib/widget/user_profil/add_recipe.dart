import 'package:flutter/material.dart';
import 'package:remake_tsiro/view/recipe_form.dart';

class AddRecipe extends StatelessWidget {
  const AddRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation){
              return const RecipeForm();
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child){
              var begin = const Offset(-1.0, 0.0);
              var end = const Offset(0.0, 0.0);
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
      child: Container(
        margin: const EdgeInsets.only(right: 8, top: 5),
        color: Colors.grey[200],
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add, color: Colors.teal,size: 35,),
            Text("Ajouter une recette", 
              style: TextStyle(
                color: Colors.blueGrey
              ),
            )
          ],
        ),
      ),
    );
  }
}