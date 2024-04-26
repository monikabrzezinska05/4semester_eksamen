import 'package:flutter/material.dart';

class IndicatorLine extends StatefulWidget {
  final String unitName;
  IndicatorLine({
    required this.unitName,
    super.key,
  });

  @override
  State<IndicatorLine> createState() => _IndicatorLineState();
}

class _IndicatorLineState extends State<IndicatorLine> {
  Color TheColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextButton(
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
        ),
        onPressed: () {
          setState(() {
            if (TheColor == Colors.red)
              {
                TheColor = Colors.green;
              }
            else
              {
                TheColor = Colors.red;
              }
          });
        },
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
                  Icon(Icons.circle, color: TheColor, size: 15)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}