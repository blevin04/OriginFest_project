import 'package:flutter/material.dart';
import 'package:hack_01/mobile_layout.dart';
import 'package:hack_01/web_layout.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
        return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth < 800)
      {
        //mobile screen layout
        //works for mobile and small tablet devices
        return MobileLayout();
      }

    // web screen layout
     return WebLayout();
    });
  }
}