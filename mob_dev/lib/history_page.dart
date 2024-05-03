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
  String selectedEventType = '';
  String selectedPerson = '';

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
          HistoryPanelFilters(
              historyElements: widget.historyElements,
              onUnitSelected: onUnitSelected),
          Expanded(
            child: HistoryElement(
              historyElements: widget.historyElements,
              selectedUnit: selectedUnit,
              selectedEventType:,
            ),
          )
        ],
      ),
    );
  }
}

class HistoryPanelFilters extends StatefulWidget {
  final List<HistoryElementModel> historyElements;
  final ValueChanged<String> onUnitSelected;
  final ValueChanged<String> onEventTypeSelected;
  final ValueChanged<String> onPersonSelected;

  const HistoryPanelFilters({super.key,
    required this.historyElements,
    required this.onUnitSelected,
    required this.onEventTypeSelected,
    required this.onPersonSelected});

  @override
  State<HistoryPanelFilters> createState() => _HistoryPanelFiltersState();
}

class _HistoryPanelFiltersState extends State<HistoryPanelFilters> {
  //TODO - Implement three string builders from historyElements
  List<String> getUnits() {
    return widget.historyElements
        .map((element) => element.unit.name)
        .toSet()
        .toList();
  }

  List<String> getEvents() {
    return widget.historyElements
        .map((element) => element.eventType.toString().substring(10))
        .toSet()
        .toList();
  }

  List<String> getPersons() {
    return widget.historyElements
        .map((element) => element.personName)
        .toSet()
        .toList();
  }

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
                historyElements: getUnits(),
                onSelected: widget.onUnitSelected,
                filterType: 'unit'),
            Spacer(),
            HistoryDropdownMenus(
                historyElements: getEvents(),
                onSelected: widget.onEventTypeSelected,
                filterType: 'event'),
            Spacer(),
            HistoryDropdownMenus(
                historyElements: getPersons(),
                onSelected: widget.onPersonSelected,
                filterType: 'person'),
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
  final ValueChanged<String> onSelected;
  String filterType = '';

  HistoryDropdownMenus({Key? key,
    required this.historyElements,
    required this.onSelected,
    required this.filterType})
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
            widget.onSelected('');
            dropdownValue = null;
          } else {
            dropdownValue = value!;
            widget.onSelected(value);
          }
        });
      },
      items: [
        DropdownMenuItem(child: Text("Filter by " + widget.filterType)),
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
  final String? selectedEventType;
  final String? selectedPerson;
  final List<HistoryElementModel> historyElements;

  const HistoryElement({super.key,
    required this.historyElements,
    required this.selectedUnit,
    required this.selectedEventType,
    required this.selectedPerson});

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

    String? unitAttribute = widget.selectedUnit;
    String? eventTypeAttribute = widget.selectedEventType;
    String? personAttribute = widget.selectedPerson;

    filteredHistoryElements
        ?.where((element) =>
    (unitAttribute == null || element.unit.name == unitAttribute) &&
        (eventTypeAttribute == null ||
            element.eventType.name == eventTypeAttribute) &&
        (personAttribute == null || element.personName == personAttribute))
        .toList();

    return ListView.builder(
      itemCount: usedListOfHistoryElements!.length,
      itemBuilder: (context, index) {
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
