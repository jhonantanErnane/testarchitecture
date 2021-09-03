import 'package:flutter/material.dart';

class Demo2Page extends StatefulWidget {
  const Demo2Page();

  @override
  Demo2PageState createState() => Demo2PageState();
}

class Demo2PageState extends State<Demo2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 2'),
      ),
      body: Center(
        child: Text('Demo 2'),
      ),
    );
  }
}
