import 'package:flutter/material.dart';

class Demo3Page extends StatefulWidget {
  const Demo3Page();

  @override
  Demo3PageState createState() => Demo3PageState();
}

class Demo3PageState extends State<Demo3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo3'),
      ),
      body: Center(
        child: Text('Demo 3'),
      ),
    );
  }
}
