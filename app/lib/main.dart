import 'package:flutter/material.dart';
import 'overview.dart' as overview;
import 'portfolio.dart' as portfolio;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Page()));

  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => PageState();
}

class PageState extends State<Page> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            destinations: const <Widget>[
              NavigationDestination(
                  icon: Icon(Icons.pie_chart), label: 'Budgets'),
              NavigationDestination(icon: Icon(Icons.home), label: 'Overview'),
              NavigationDestination(
                  icon: Icon(Icons.list_alt), label: 'Portfolio'),
            ],
            selectedIndex: currentPageIndex,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          )),
      body: <Widget>[Container(), const Overview(), const portfolio.Portfolio()][currentPageIndex],
    );
  }
}

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [overview.Overview(), overview.Spending()],
            ))
    );

  }
}
