import 'package:flutter/material.dart';

class IndicatorHeadline extends StatefulWidget {
  final String headline;
  final String indicatorColor;
   IndicatorHeadline({
    required this.headline,
     required this.indicatorColor,
    super.key,
  });

  @override
  State<IndicatorHeadline> createState() => _IndicatorHeadlineState();
}

class _IndicatorHeadlineState extends State<IndicatorHeadline> {
  Color TheColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40),
          child: Row(
            children: [
              Text(widget.headline, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              // Insert whitespace so screen is filled
              const Spacer(),
              // Add a circular indicator that can change colour
              Icon(Icons.circle, color: TheColor)
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