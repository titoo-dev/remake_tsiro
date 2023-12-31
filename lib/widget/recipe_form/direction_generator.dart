import 'package:flutter/material.dart';

class DirectionGenerator extends StatefulWidget {
  const DirectionGenerator({super.key});

  @override
  State<DirectionGenerator> createState() => _DirectionGeneratorState();
}

class _DirectionGeneratorState extends State<DirectionGenerator> {
  final _listKey = GlobalKey<AnimatedListState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  AnimatedListRemovedItemBuilder builder = (context, animation) {
    var tween =
        Tween(begin: 1.0, end: 0.0).chain(CurveTween(curve: Curves.ease));
    return FadeTransition(
      opacity: animation.drive(tween),
      child: Container(),
    );
  };

  var directions = [];

  void _loadItems() {
    final fetchedList = [
      _buildDirectionTile(
          "Arotsaka ny farine 100 kg ary andrasana afaka 10 minitra eo ho eo, Arotsaka ny farine 100 kg ary andrasana afaka 10 minitra eo ho eo"),
      _buildDirectionTile(
          "Arotsaka ny farine 100 kg ary andrasana afaka 10 minitra eo ho eo"),
    ];

    var future = Future(() {});
    for (var i = 0; i < fetchedList.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 300), () {
          directions.add(fetchedList[i]);
          _listKey.currentState?.insertItem(directions.length - 1);
        });
      });
    }
  }

  Widget _buildDirectionTile(String direction) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[400],
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              direction,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ));
  }

  Future _addIngredient() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            elevation: 5,
            contentPadding: const EdgeInsets.symmetric(horizontal: 26),
            title: const Text(
              "Entrez votre texte",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            ),
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: TextField(
                  maxLines: 8,
                  textCapitalization: TextCapitalization.none,
                  controller: _controller,
                  cursorColor: Colors.black87,
                  maxLength: 70,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                      hintText: "Directive ici",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w300)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amberAccent),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Ajouter",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 200, right: 20),
            child: SizedBox(
              height: 440,
              child: AnimatedList(
                key: _listKey,
                initialItemCount: directions.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index, animation) {
                  var myTween = Tween<double>(begin: 0.0, end: 1.0)
                      .chain(CurveTween(curve: Curves.easeOut));
                  return FadeTransition(
                    opacity: animation.drive(myTween),
                    child: directions[index],
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            child: InkWell(
              onTap: () {
                _addIngredient().then((onValue) {
                  if (_controller.text != "") {
                    directions.add(_buildDirectionTile(_controller.text));
                    _listKey.currentState?.insertItem(directions.length - 1);
                    _controller.text = "";
                  }
                });
              },
              child: const Chip(
                elevation: 5,
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                labelStyle: TextStyle(fontSize: 20),
                label: Text("Ajouter une étape"),
                avatar: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
