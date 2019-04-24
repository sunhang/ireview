import 'package:flutter/material.dart';

import 'LinearEquation.dart';

class DetailWidget extends StatelessWidget {
  final int data;

  DetailWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: new LinearEquation()),
    );
  }
}
