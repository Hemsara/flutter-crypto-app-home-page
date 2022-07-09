// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'components/crypto_list.dart';
import 'components/for_you_section.dart';
import 'components/wallets.dart';

void main() {
  runApp(const CryptoApp());
}
/* 
  Flutter crypto currency app user interface
  Content by @vhemsara
*/
class CryptoApp extends StatelessWidget {
  const CryptoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                MAppBar(),
                SizedBox(
                  height: 30,
                ),
                Wallets(),
                ForYouSection(),
                CryptoList()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        selectedItemColor: Color(0xff177DFF),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, size: 27),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bag, size: 27),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart, size: 27),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.link, size: 27),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
