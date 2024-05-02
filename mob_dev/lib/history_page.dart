import 'package:flutter/cupertino.dart';
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
      body: Column(
        children: [HistoryFilterElement(historyElements: widget.historyElements), Expanded(child: HistoryElement(historyElements: widget.historyElements))],
      ),
    );
  }
}

class HistoryFilterElement extends StatefulWidget {
  final List<HistoryElementModel> historyElements;
  const HistoryFilterElement({Key? key, required this.historyElements}) : super(key: key);

  @override
  State<HistoryFilterElement> createState() => _HistoryFilterElementState();
}

class _HistoryFilterElementState extends State<HistoryFilterElement> {
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.historyElements[0].unit.name;
  }

  @override
  Widget build(BuildContext context) {
    var eventTypes = widget.historyElements.map((historyElement) => historyElement.unit.name).toSet();

    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.pink),
      underline: Container(
        height: 2,
        color: Colors.pink,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.historyElements.map<DropdownMenuItem<String>>((HistoryElementModel value) {
        return DropdownMenuItem<String>(
          value: value.unit.name,
          child: Text(value.unit.name),
        );
      }).toList(),
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
          title: Text(historyElement.unit.name),
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
