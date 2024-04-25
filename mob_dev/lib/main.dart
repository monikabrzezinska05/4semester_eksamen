import 'package:flutter/material.dart';

import 'indicator_headline_widget.dart';
import 'indicator_lines.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final List<String> headline = ['MaserUnit 1', 'MasterUnit 2', 'MsterUnit 3'];
  final List<String> underheadlines = ['Unit 1', 'Unit 2', 'Unit 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material 3'),
      ),
      body: ListView.builder(
        itemCount: headline.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              IndicatorHeadline(headline: headline[index]),
              ...underheadlines.map((unit) => IndicatorLine(unitName: unit)).toList(),
            ],
          );
        },
      ),
    );
  }
}

