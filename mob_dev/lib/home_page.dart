import 'package:flutter/material.dart';

import 'indicator_headline_widget.dart';
import 'indicator_lines.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.headline,
    required this.underheadlines,
  });

  final List<String> headline;
  final List<String> underheadlines;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: headline.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            IndicatorHeadline(headline: headline[index]),
            ...underheadlines.map((unit) => IndicatorLine(unitName: unit)).toList(),
          ],
        );
      },
    );
  }
}