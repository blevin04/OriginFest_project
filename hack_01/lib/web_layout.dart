import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:const Text("Application Logo"),
        actions: [
          
        ],
      ),
      body: Row(
        children: [
          StatefulBuilder(
            builder: (BuildContext context, setStatenavigation) {
              return Card(
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.mapLocationDot,
                      size: 30,
                    ),
                    FaIcon(FontAwesomeIcons.layerGroup),
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    Icon(
                      Icons.group,
                      size: 30,
                    ),
                    FaIcon(
                      FontAwesomeIcons.user,
                      size: 30,
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}