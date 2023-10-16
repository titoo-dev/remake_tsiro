import 'package:flutter/material.dart';
import 'package:remake_tsiro/widget/user_profil/add_recipe.dart';
import 'package:remake_tsiro/widget/user_profil/cook_book.dart';

class MyCustomTabView extends StatefulWidget {
  const MyCustomTabView({super.key});


  @override
  State<MyCustomTabView> createState() => _MyCustomTabViewState();
}

class _MyCustomTabViewState extends State<MyCustomTabView> {
  bool _selected = false;

  @override
  void initState() {
    _selected = true;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: (){
                  setState(() {
                    _selected = true;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey
                    ),
                    color: _selected ? Colors.teal : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)
                    )
                  ),
                  width: 160,
                  child: Center(child: Text("Mes recettes", 
                    style: TextStyle(
                      color: _selected ? Colors.white : Colors.grey,
                      fontSize: 16
                    ),)),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    _selected = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 160,
                  decoration: BoxDecoration(
                    color: _selected ? Colors.white : Colors.teal,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)
                    )
                  ),
                  child: Center(child: Text("Collection", 
                    style: TextStyle(
                      fontSize: 16,
                      color: _selected ? Colors.grey : Colors.white
                    ),
                  )),
                ),
              )
            ],
          ),
        ),

        const SizedBox(height: 12,),
        const Divider(),

        SizedBox(
          height: 400,
          child: Builder(
            builder: (context){
              var books = [
                const AddRecipe(),
                const CookBook(
                  id: "1",
                  imagePath: "assets/image/recette.jpg",
                  title: "Crème glacé",
                ),
                const CookBook(
                  id: "2",
                  imagePath: "assets/image/recette.jpg",
                  title: "Sauce soja",
                ),
                const CookBook(
                  id: "3",
                  imagePath: "assets/image/recette.jpg",
                  title: "Pizza framboise",
                ),
                const CookBook(
                  id: "4",
                  imagePath: "assets/image/recette.jpg",
                  title: "Spagetti",
                ),
                const CookBook(
                  id: "5",
                  imagePath: "assets/image/recette.jpg",
                  title: "Fromage",
                ),
              ];
              return GridView.builder(
                padding: const EdgeInsets.all(5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: books.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  if(_selected){
                    return books[index];
                  }
                  return Card(
                    child: Container(
                      color: Colors.grey[200],
                      height: 100,
                    ),
                  );
                },
              );
            }
          ),
        )
      ],
    );
  }
}

