import 'package:flutter/material.dart';
import 'package:remake_tsiro/view/recipe_more_info.dart';

class TrendingElement extends StatefulWidget {
  final String id;
  final bool active; 
  final String title;
  final String imagePath;
  const TrendingElement({super.key, required this.id, required this.active, required this.title, required this.imagePath});
  @override
  State<TrendingElement> createState() => _TrendingElementState();
}


class _TrendingElementState extends State<TrendingElement> {
  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double top = widget.active ? 0 : 8;
    final double bottom = widget.active ? 0 : 8;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context){
            return InfoPage(
              id: widget.id,
              image: widget.imagePath,
            );
          }
        ));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: EdgeInsets.only(right: 14, top: top, bottom: bottom),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Builder(
          builder: (context){
            if(!_isLoading){
              return Row(
                children: <Widget>[
                SizedBox(
                    width: 120,
                    height: 120,
                    child: Hero(
                      tag: widget.id,
                      child: Image.asset(widget.imagePath, fit: BoxFit.cover,)),
                  ),

                  Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 180,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 18),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.title, 
                                  style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ),

                              const SizedBox(height: 6,),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Skillet Recipe",
                                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: 85,
                        left: 18,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Icon(Icons.star, size: 20, color: Colors.amber,),
                                const Icon(Icons.star, size: 20, color: Colors.amber,),
                                const Icon(Icons.star, size: 20, color: Colors.amber,),
                                const Icon(Icons.star, size: 20, color: Colors.amber,),
                                Icon(Icons.star, size: 20, color: Colors.grey[200],),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }
            return const TrendingPlaceholder();
          },
        ),
      ),
    );
  }
}



class TrendingPlaceholder extends StatelessWidget {
  const TrendingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          width: 120,
        )
      ],
    );
  }
}