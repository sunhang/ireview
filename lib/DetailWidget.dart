import 'package:flutter/material.dart';

import 'LinearEquation.dart';

class DetailWidget extends StatelessWidget {
  final int data;

  DetailWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(child: new Center(child: new LinearEquation())));
  }
}
