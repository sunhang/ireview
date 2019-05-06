import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart'
    show SeekBar, ProgressValue;

typedef void NotifyRefresh();

class SeekbarInitalData {
  double current;
  final String title;
  final double min;
  final double max;

  SeekbarInitalData(this.title, this.min, this.max, this.current);
}

List<Widget> seekbars(BuildContext context, List<SeekbarInitalData> initalData,
    NotifyRefresh notifyRefresh) {
  List<Widget> widgets = new List<Widget>();

  const int SECTION_COUNT = 100;

  initalData.forEach((element) {
    var padding = Padding(
      padding: new EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          Padding(
            padding: new EdgeInsets.only(right: 10),
            child: Text(element.title, style: TextStyle(fontSize: 20)),
          ),
          Expanded(
              child: SeekBar(
                  progresseight: 8,
                  value: (element.current - element.min) *
                      SECTION_COUNT /
                      (element.max - element.min),
                  sectionCount: SECTION_COUNT,
                  onValueChanged: (ProgressValue value) {
                    element.current =
                        value.value * (element.max - element.min) / 100 +
                            element.min;
                    notifyRefresh();
                  })),
        ],
      ),
    );

    widgets.add(padding);
  });

  return widgets;
}


class Coefficients {
  LinkedHashMap<String, SeekbarInitalData> _coefficients =
      new LinkedHashMap<String, SeekbarInitalData>();

  void add(String coefficient, double min, double max, double current) {
    _coefficients[coefficient] = SeekbarInitalData(coefficient, min, max, current);
  }

  List<Widget> createSeekbars(BuildContext context, NotifyRefresh notify) {
    return seekbars(context, _asList(), notify);
  }

  List<SeekbarInitalData> _asList() => _coefficients.entries.map((entry) => entry.value).toList();

  SeekbarInitalData operator [](String key) => _coefficients[key];
}
