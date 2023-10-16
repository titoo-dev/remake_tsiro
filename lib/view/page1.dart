import 'package:flutter/material.dart';
import 'package:remake_tsiro/widget/page1/recipe_info.dart';
import 'package:remake_tsiro/widget/page1/trending.dart';
import 'package:remake_tsiro/widget/page1/trending_page_view.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[RecipeInfo(), Trending()],
          ),
          TrendingPageView(),
        ],
      ),
    );
  }
}
