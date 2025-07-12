import 'package:flutter/material.dart';
import 'package:information/features/advicer/presentation/screen/advicer_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:information/features/cats/presentaion/cat_screen.dart';
import 'package:information/features/quote/quote_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }

  final List<Widget> _screens = [AdviceScreen(),QuotesPage(),CatFactScreen() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTap,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.lightGreen,
          unselectedItemColor: Colors.blueGrey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.tips_and_updates),
              label: 'Advices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_quote),
              label: 'Quots',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cat),
              label: "Cats",
            ),
           
          ],
        ),
      ),
    );
  }
}
