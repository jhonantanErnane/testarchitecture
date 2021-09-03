import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/constants/page_names.dart';

class SplashPage extends StatelessWidget {
  const SplashPage();

  void _gotoHome() {
    Future.delayed(Duration(milliseconds: 500)).then(
        (value) => Modular.to.pushReplacementNamed('/${PageNames.general}'));
  }

  @override
  Widget build(BuildContext context) {
    _gotoHome();
    return Container(
        color: Colors.white,
        child: Center(
          child: Icon(
            Icons.flutter_dash,
            size: MediaQuery.of(context).size.width * 0.6,
          ),
        ));
  }
}
