import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  final String data;

  Photo({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
            child: Image(
          image: NetworkImage(data == null
              ? 'https://images.unsplash.com/photo-1498180695800-1063c5f3d65c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
              : data),
        )),
      ),
    );
  }
}
