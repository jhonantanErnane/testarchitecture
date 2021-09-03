import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_app_bar_widget.dart';

class Demo1Page extends StatelessWidget {
  const Demo1Page();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'Page 1',
        withIcon: true,
      ),
      body: Center(child: Text('Page 1'),)
    );
  }
}
