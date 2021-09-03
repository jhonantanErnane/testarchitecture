import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_controller.dart';

class AboutPage extends StatefulWidget {
  const AboutPage();

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends ModularState<AboutPage, AboutController> {
  void _openExternalLink(String url, BuildContext context) {
    canLaunch(url).then((status) {
      if (status) {
        launch(url);
      } else {
        // Show an snackbar error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Não foi possível abrir o site, tente novamente mais tarde'),
            duration: Duration(seconds: 15),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sobre")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('App Contatos', style: TextStyle(fontSize: 20))),
          SizedBox(height: 30),
          Center(
            child: Text('App Flutter by:', style: TextStyle(fontSize: 20)),
          ),
          Center(
            child: Text(
              "Jhonantan Ernane",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  iconSize: 50,
                  icon: Icon(FontAwesomeIcons.github),
                  onPressed: () => _openExternalLink(
                    "https://github.com/jhonantanErnane",
                    context,
                  ),
                ),
                SizedBox(width: 30),
                IconButton(
                  iconSize: 50,
                  icon: Icon(FontAwesomeIcons.linkedin),
                  onPressed: () => _openExternalLink(
                    "https://linkedin.com/in/jhonantan-ernane/",
                    context,
                  ),
                ),
              ])
        ],
      ),
    );
  }
}
