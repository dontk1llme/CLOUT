import 'package:flutter/material.dart';
import './widgets/NavBar/nav_bar.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;

  setTab(tabIndex) {
    setState(() {
      tab = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined)),
          title: TextButton(onPressed: () {}, child: Text('CLOUT')),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.notifications_outlined))
          ],
        ),
        bottomNavigationBar: NavBar(tab: tab, setTab: setTab));
  }
}
