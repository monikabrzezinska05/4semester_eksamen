import 'package:flutter/material.dart';

import 'models/unit/unit_model.dart';

class IndicatorLine extends StatefulWidget {
  final String unitName;
  final Status unitStatus;

  IndicatorLine({
    required this.unitName,
    required this.unitStatus,
    super.key,
  });

  @override
  State<IndicatorLine> createState() => _IndicatorLineState();
}

class _IndicatorLineState extends State<IndicatorLine> {
  Color getColorForStatus(Status status){
    if(status == Status.Armed || status == Status.Closed) {
      return Colors.green;
    } else if (status == Status.Disarmed || status == Status.Open) {
      return Colors.yellow;
    } else if (status == Status.Triggered){
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 2.5, top: 5),
              child: Row(
                children: [
                  Text(widget.unitName, style: TextStyle(fontSize: 14)),
                  // Insert whitespace so screen is filled
                  const Spacer(),
                  // Add a circular indicator that can change colour
                  Padding(
                    padding: const EdgeInsets.only(right: 11.5),
                    child: Icon(Icons.circle, color: getColorForStatus(widget.unitStatus), size: 15),
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}