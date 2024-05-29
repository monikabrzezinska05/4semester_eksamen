import 'package:flutter/material.dart';
import 'package:mob_dev/models/unit/unit_model.dart';
import 'package:mob_dev/utillities.dart';

class IndicatorHeadline extends StatelessWidget {
  final String headline;
  final Status status;
  final List<UnitModel> units;

  IndicatorHeadline({
    required this.headline,
    Key? key, required this.status, required this.units,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40),
          child: Row(
            children: [
              Text(headline, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              // Insert whitespace so screen is filled
              const Spacer(),
              // Add a circular indicator that can change colour
              Icon(Icons.circle, color: headlineStatusColor(status, units)),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}