import 'package:flutter/material.dart';
import 'package:remake_tsiro/widget/page2/recent_element.dart';

class ListOfRecent extends StatefulWidget {
  const ListOfRecent({super.key});

  @override
  State<ListOfRecent> createState() => _ListOfRecentState();
}

class _ListOfRecentState extends State<ListOfRecent> {
  bool _isLoading = false;
  final _listItems = <Widget>[];
  final _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _loading();
  }

  void _loading() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    }).then((_) {
      _loadItems();
    });
  }

  void _loadItems() {
    final fetchedList = [
      const RecentElement(
        id: "1",
        imagePath: "assets/image/recette.jpg",
        title: "Sauce Tomate ", rate: null,
      ),
      const RecentElement(
        id: "2",
        imagePath: "assets/image/recette.jpg",
        title: "Calzon",
      ),
      const RecentElement(
        id: "3",
        imagePath: "assets/image/recette.jpg",
        title: "Sauce Vinegrette ",
      ),
      const RecentElement(
        id: "4",
        imagePath: "assets/image/recette.jpg",
        title: "Sauce Bolognaise",
      ),
      const RecentElement(
        id: "5",
        imagePath: "assets/image/recette.jpg",
        title: "Pomme fruite",
      ),
      const RecentElement(
        id: "6",
        imagePath: "assets/image/recette.jpg",
        title: "Pizza 4 fromage",
      ),
      const RecentElement(
        id: "7",
        imagePath: "assets/image/recette.jpg",
        title: "Composé spécial",
      ),
      const RecentElement(
        id: "8",
        imagePath: "assets/image/recette.jpg",
        title: "Tarte au pomme",
      ),
      const RecentElement(
        id: "9",
        imagePath: "assets/image/recette.jpg",
        title: "Pizza au fromage",
      ),
      const RecentElement(
        id: "10",
        imagePath: "assets/image/recette.jpg",
        title: "Pizza margerita",
      ),
    ];

    var future = Future(() {});
    for (var i = 0; i < fetchedList.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 500), () {
          _listItems.add(fetchedList[i]);
          _listKey.currentState?.insertItem(_listItems.length - 1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
            height: 494,
            child: Builder(builder: (BuildContext context) {
              if (!_isLoading) {
                return AnimatedList(
                  key: _listKey,
                  initialItemCount: _listItems.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index, animation) {
                    var myTween = Tween<double>(begin: 0.0, end: 1.0)
                        .chain(CurveTween(curve: Curves.easeOut));
                    return FadeTransition(
                      opacity: animation.drive(myTween),
                      child: _listItems[index],
                    );
                  },
                );
              }
              return const PlaceholderList();
            })),
      ],
    );
  }
}

class PlaceholderList extends StatelessWidget {
  const PlaceholderList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 487,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Container(
                color: Colors.grey[200],
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.grey[200],
                      width: 180,
                      height: 20,
                    ),
                    Container(
                      color: Colors.grey[200],
                      width: 180,
                      height: 12,
                    ),
                    Container(
                      color: Colors.grey[200],
                      width: 180,
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
