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
  String selectedUnit = '';

  List<String> getUnits() {
    List<String> units = widget.historyElements
        .map((element) => element.unit.name)
        .toSet()
        .toList();
    return units;
  }

  void onUnitSelected(String unit) {
    setState(() {
      selectedUnit = unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('history'),
      ),
      body: Column(
        children: [
         HistoryPanelFilters(historyElements: getUnits(), onUnitSelected: onUnitSelected),
          Expanded(
              child: HistoryElement(
            historyElements: widget.historyElements,
            selectedUnit: selectedUnit,
          ))
        ],
      ),
    );
  }
}

class HistoryPanelFilters extends StatefulWidget {

  final List<String> historyElements;
  final ValueChanged<String> onUnitSelected;

  const HistoryPanelFilters({super.key, required this.historyElements, required this.onUnitSelected});

  @override
  State<HistoryPanelFilters> createState() => _HistoryPanelFiltersState();
}

class _HistoryPanelFiltersState extends State<HistoryPanelFilters> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Filters"),
      children: [
        Row(
          children: [
            Spacer(),
            Spacer(),
            HistoryDropdownMenus(
              historyElements: widget.historyElements,
              onUnitSelected: widget.onUnitSelected,
            ),
            Spacer(),
            HistoryDropdownMenus(
              historyElements: widget.historyElements,
              onUnitSelected: widget.onUnitSelected,
            ),
            Spacer(),
            HistoryDropdownMenus(
              historyElements: widget.historyElements,
              onUnitSelected: widget.onUnitSelected,
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ],
    );
  }
}


class HistoryDropdownMenus extends StatefulWidget {
  final List<String> historyElements;
  final ValueChanged<String> onUnitSelected;

  const HistoryDropdownMenus(
      {Key? key, required this.historyElements, required this.onUnitSelected})
      : super(key: key);

  @override
  State<HistoryDropdownMenus> createState() => _HistoryDropdownMenusState();
}

class _HistoryDropdownMenusState extends State<HistoryDropdownMenus> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("Filter by unit"),
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepOrange),
      underline: Container(
        height: 2,
        color: Colors.deepOrange,
      ),
      onChanged: (String? value) {
        setState(() {
          if (value == null) {
            widget.onUnitSelected('');
            dropdownValue = null;
          } else {
            dropdownValue = value!;
            widget.onUnitSelected(value);
          }
        });
      },
      items: [
        DropdownMenuItem(child: Text("Filter by unit")),
        ...widget.historyElements.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList()
      ],
    );
  }
}

class HistoryElement extends StatefulWidget {
  final String? selectedUnit;
  final List<HistoryElementModel> historyElements;

  const HistoryElement(
      {super.key, required this.historyElements, required this.selectedUnit});

  @override
  State<HistoryElement> createState() => _HistoryElementState();
}

class _HistoryElementState extends State<HistoryElement> {
  List<HistoryElementModel>? filteredHistoryElements;
  List<HistoryElementModel>? usedListOfHistoryElements;

  void checkFilter() {
    if (filteredHistoryElements!.length > 0) {
      usedListOfHistoryElements = filteredHistoryElements!;
    } else {
      usedListOfHistoryElements = widget.historyElements;
    }
  }

  @override
  Widget build(BuildContext context) {
    filteredHistoryElements = widget.historyElements
        .where((element) => element.unit.name == widget.selectedUnit)
        .toList();
    checkFilter();

    return ListView.builder(
      itemCount: usedListOfHistoryElements!.length,
      itemBuilder: (context, index) {
        ;
        return ListTile(
          title: Text(usedListOfHistoryElements![index].unit.name),
          subtitle: Text(generateSubtitle(usedListOfHistoryElements![index])),
          trailing: Text(DateFormat('H:m:s d/M/y')
              .format(usedListOfHistoryElements![index].date)),
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
