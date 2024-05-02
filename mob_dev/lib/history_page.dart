import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/History/history_element_model.dart';

class HistoryPage extends StatefulWidget {
  final List<HistoryElementModel> historyElements;
  const HistoryPage({super.key, required this.historyElements});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('history'),
      ),
      body:  Center(
        child: HistoryElement(historyElements: widget.historyElements)
      ),
    );
  }
}

class HistoryElement extends StatefulWidget {
  final List<HistoryElementModel> historyElements;
  const HistoryElement({super.key, required this.historyElements});

  @override
  State<HistoryElement> createState() => _HistoryElementState();
}

class _HistoryElementState extends State<HistoryElement> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.historyElements.length,
      itemBuilder: (context, index) {
        final historyElement = widget.historyElements[index];
        return ListTile(
          title: Text(historyElement.unitName),
          subtitle: Text(generateSubtitle(historyElement)),
          trailing: Text(DateFormat('H:m:s d/M/y').format(historyElement.date)),
        );
      },
    );
  }

  String generateSubtitle(HistoryElementModel historyElement) {
    switch (historyElement.eventType) {
      case EventType.AlarmStopped:
        return "Alarm stopped by " + historyElement.personName;
      case EventType.AlarmArmed:
        return "Alarm armed by " + historyElement.personName;
      case EventType.AlarmDisarmed:
        return "Alarm disarmed by " + historyElement.personName;
      case _:
        return "Event: " + historyElement.eventType.toString();
    }
  }
}
