import 'package:flutter/material.dart';
import 'package:flutterapp/screens/photo.dart';
import 'list.dart';



class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: sectionIndex == 0 ? Text('List') : Text('Photo'),
      ),
      body: sectionIndex == 0 ? ListPhoto() : Photo(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text('List'), icon: Icon(Icons.add_to_photos)),
          BottomNavigationBarItem(
              title: Text('Photo'), icon: Icon(Icons.photo_album)),
        ],
        currentIndex: sectionIndex,
        backgroundColor: Colors.white30,
        selectedItemColor: Colors.white,
        onTap: (int index) {
          setState(() {
            sectionIndex = index;
          });
        },
      ),
    );
  }
}
