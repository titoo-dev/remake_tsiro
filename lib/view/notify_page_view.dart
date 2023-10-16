import 'package:flutter/material.dart';
import 'package:remake_tsiro/view/page1.dart';
import 'package:remake_tsiro/view/page2.dart';

class NotifyPageView extends StatefulWidget {
  final ValueNotifier notifier;

  const NotifyPageView({Key? key, required this.notifier}) : super(key: key);

  @override
  State<NotifyPageView> createState() => _NotifyPageViewState();
}

class _NotifyPageViewState extends State<NotifyPageView> {
  late PageController _pageController;

  void _onScroll() {
    widget.notifier.value = _pageController.page?.abs();
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: const <Widget>[
        Page1(),
        Page2(),
      ],
    );
  }
}
