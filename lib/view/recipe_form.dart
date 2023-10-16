import 'package:flutter/material.dart';
import 'package:remake_tsiro/widget/recipe_form/form_01.dart';
import 'package:remake_tsiro/widget/recipe_form/form_02.dart';
import 'package:remake_tsiro/widget/recipe_form/form_03.dart';
import 'package:remake_tsiro/widget/recipe_form/form_04.dart';
import 'package:remake_tsiro/widget/recipe_form/form_05.dart';
import 'package:remake_tsiro/widget/recipe_form/form_06.dart';
import 'package:remake_tsiro/widget/recipe_form/form_07.dart';
import 'package:remake_tsiro/widget/recipe_form/form_08.dart';

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key});

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  int currentPage = 1;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    _controller.addListener((){
      setState(() {
        currentPage = _controller.page!.toInt() + 1;
      });
    });
    super.initState();
  }
  final pages = [
    const Form01(),
    const Form02(),
    const Form03(),
    const Form04(),
    const Form05(),
    const Form06(),
    const Form07(),
    const Form08()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pages.length,
            controller: _controller,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),

          Positioned(
            right: 20,
            bottom: 20,
            child: SizedBox(
              height: 50,
              child: Material(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        _controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          border: Border(right: BorderSide(color: Colors.white70))
                        ),
                        width: 50,
                        height: 50,
                        child: const Icon(Icons.keyboard_arrow_up, color: Colors.white,),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        width: 50,
                        height: 50,
                        child: const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: (){
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
      )
    );
  }
}
