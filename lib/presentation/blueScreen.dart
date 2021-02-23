import 'package:flutter/material.dart';

class BlueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text('Ok!'),
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.wifi,
              size: 50,
              color: Colors.white,
            ),
            Text(
              '¡Hola que tal!',
              style: TextStyle(fontSize: 33, color: Colors.white),
            ),
          ],
        )));
  }
}
