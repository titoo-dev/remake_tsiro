import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {

  final List<dynamic> levelList;

  const MultiSelectChip({super.key, required this.levelList});

  @override
  State<MultiSelectChip> createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {

  String selectedChoice = "";


  _buildChoiceList(){
    List<Widget> choice = [];

    for (var item in widget.levelList) {
      choice.add(Container(
        padding: const EdgeInsets.all(2),
        child: ChoiceChip(
          elevation: 2,
          labelStyle: TextStyle(color: (selectedChoice == item) ? Colors.white : Colors.black87),
          selectedColor: Colors.teal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          label: Text(item), 
          selected: selectedChoice == item,
          onSelected: (selected){
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    }
    return choice;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: _buildChoiceList(),
      ),
    );
  }
}