import 'package:flutter/material.dart';

import 'base.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @protected
  Coefficients coefficients = Coefficients();

  @protected
  List<Widget> createSeekbars(BuildContext context) {
    return coefficients.createSeekbars(
      context,
      () {
        setState(() {});
      },
    );
  }
}
