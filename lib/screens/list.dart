import 'package:flutter/material.dart';
import 'package:flutterapp/api/api.dart';
import 'package:flutterapp/screens/photo.dart';

class ListPhoto extends StatefulWidget {
  @override
  _ListPhotoState createState() => _ListPhotoState();
}

class _ListPhotoState extends State<ListPhoto> {
  var _photosArray = [];

  void initState() {
    ApiService.getPhotoList().then((data) => setState(() {
          _photosArray = data;
        }));
    super.initState();
  }

  Widget build(BuildContext context) {
    if (_photosArray.length == 0 || _photosArray[0] == null) {
      return new Container(
          child: Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Container(
                  child: Center(
                child: Text('Wait ...', style: TextStyle(fontSize: 24)),
              ))));
    } else {
      return new Container(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(70),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _photosArray.map((e) {
                      String author = e['user']['username'];
                      String description = e['description'];
                      return GestureDetector(
                          child: Column(children: <Widget>[
                            Image(image: NetworkImage(e['urls']['small'])),
                            SizedBox(height: 50),
                            Text('Autor: $author'),
                            description == null ? Text('Description: Empty description') : Text('Name: $description'), 
                            SizedBox(height: 50),
                          ]),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              int sectionIndex = 1;
                              return (Scaffold(
                                backgroundColor: Theme.of(context).primaryColor,
                                appBar: AppBar(
                                  centerTitle: true,
                                  title: sectionIndex == 0
                                      ? Text('List')
                                      : Text('Photo'),
                                ),
                                body: Photo(data: e['urls']['small']),
                              ));
                            }));
                          });
                    }).toList()),
              ),
            ),
          ),
        ),
      );
    }
  }
}
