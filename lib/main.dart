import 'package:flutter/material.dart';
import 'package:remake_tsiro/view/notify_page_view.dart';
import 'package:remake_tsiro/widget/custom_drawer.dart';
import 'package:remake_tsiro/widget/custom_end_drawer.dart';
import 'package:remake_tsiro/widget/page1/video.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ValueNotifier<double> _notifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      drawerScrimColor: Colors.black.withOpacity(0.2),
      endDrawer: const CustomEndDrawer(),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const BackgroundVideo(),
            Container(
              color: Colors.black26,
            ),
            AnimatedBuilder(
                animation: _notifier,
                builder: (context, _) {
                  return Opacity(
                      opacity: _notifier.value.abs(),
                      child: Container(color: Colors.white));
                }),
            NotifyPageView(
              notifier: _notifier,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
                  // search bar
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
