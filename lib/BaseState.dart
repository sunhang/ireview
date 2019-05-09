import 'package:flutter/material.dart';

import 'base.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {

  @protected
  List<Widget> createSeekbars(BuildContext context) {
    return sliders(
      context,
      seekBarDataItems,
      () {
        setState(() {});
      },
    );
  }

  List<SliderDataItem> get seekBarDataItems;

  String getTitle();

  CustomPainter createCustomPainter(BuildContext context);

  String _lastestCoefficients() {
    var buffer = StringBuffer();

    seekBarDataItems.forEach((it) {
      buffer
        ..write(it.title)
        ..write(":")
        ..write(it.current.toStringAsFixed(1))
        ..write(" ");
    });

    return buffer.toString().trim();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: new EdgeInsets.only(bottom: 10),
          child: Text(
            getTitle(),
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
            padding: new EdgeInsets.only(bottom: 30),
            child: Text(_lastestCoefficients(),
                style: TextStyle(fontSize: 20, color: Colors.red))),
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: CustomPaint(painter: createCustomPainter(context)),
        ),
      ]..addAll(createSeekbars(context)),
    );
  }
}
