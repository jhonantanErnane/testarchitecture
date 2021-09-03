import 'package:flutter/material.dart';

class Demo4Page extends StatefulWidget {
  const Demo4Page();

  @override
  Demo4PageState createState() => Demo4PageState();
}

class Demo4PageState extends State<Demo4Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 4'),
      ),
      body: Center(
        child: Text('Demo 4'),
      ),
    );
  }
}
