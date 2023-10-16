import 'package:flutter/material.dart';
import 'package:remake_tsiro/model/recipe.dart';
import 'package:remake_tsiro/widget/page1/trending_element.dart';

class TrendingPageView extends StatefulWidget {
  const TrendingPageView({super.key});

  @override
  State<TrendingPageView> createState() => _TrendingPageViewState();
}

class _TrendingPageViewState extends State<TrendingPageView> {

  int currentPage = 0;
  final PageController _controller = PageController(initialPage: 0, viewportFraction: 0.9);
 
  final elements = [
    Recipe(
      id: "1",
      imagesPath: [
        "assets/image/recette.jpg"
      ],
      name: "Spagetti bolognaise"
    ),
    Recipe(
      id: "2",
      imagesPath: [
        "assets/image/recette.jpg"
      ],
      name: "Tacosse"
    ),
    Recipe(
      id: "3",
      imagesPath: [
        "assets/image/recette.jpg"
      ],
      name: "Crème desert"
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      int next = _controller.page!.round();

      if(currentPage != next){
        setState(() {
          currentPage = next;
        });
      }

    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 490),
          child: SizedBox(
            height: 120,
            child: PageView.builder(
              itemCount: elements.length,
              controller: _controller,
              itemBuilder: (context, index) {
                bool active = index == currentPage;
                return TrendingElement(
                  id: elements[index].id,
                  title: elements[index].name,
                  imagePath: elements[index].imagesPath[0],
                  active: active,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}