import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart'
    show SeekBar, ProgressValue;

class XValues {
  final double start;
  final double end;
  final double step;

  const XValues(this.start, this.end, this.step);
}


typedef void NotifyRefresh();

class SliderDataItem {
  double current;
  final String title;
  final double min;
  final double max;

  SliderDataItem(this.title, this.min, this.max, this.current);
}

List<Widget> sliders(BuildContext context, List<SliderDataItem> initalData,
    NotifyRefresh notifyRefresh) {
  List<Widget> widgets = new List<Widget>();

  const int SECTION_COUNT = 100;

  initalData.forEach((element) {
    var padding = Padding(
      padding: new EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
      child: Row(
        children: <Widget>[
          Padding(
            padding: new EdgeInsets.only(right: 10),
            child: Text(element.title, style: TextStyle(fontSize: 20)),
          ),
          Expanded(
              child: Slider(
                  min: 0,
                  max: 100,
                  value: (element.current - element.min) *
                      SECTION_COUNT /
                      (element.max - element.min),
                  onChanged: (value) {
                    element.current =
                        value * (element.max - element.min) / 100 + element.min;
                    notifyRefresh();
                  })),
        ],
      ),
    );

    widgets.add(padding);
  });

  return widgets;
}
