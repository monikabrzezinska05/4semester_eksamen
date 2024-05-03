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

  void onEventSelected(String unit) {
    setState(() {
      selectedEventType = unit;
    });
  }

  void onPersonSelected(String unit) {
    setState(() {
      selectedPerson = unit;
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
          Expanded(
            child: HistoryElement(
              historyElements: widget.historyElements,
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
  final VoidCallback? onResetFilters;

  const HistoryPanelFilters(
      {super.key,
      required this.historyElements,
      required this.onUnitSelected,
      required this.onEventTypeSelected,
      required this.onPersonSelected,
      required this.onResetFilters});

  @override
  State<HistoryPanelFilters> createState() => _HistoryPanelFiltersState();
}

class _HistoryPanelFiltersState extends State<HistoryPanelFilters> {
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
            ElevatedButton(onPressed: widget.onResetFilters, child: Text("Reset"))
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

  HistoryDropdownMenus(
      {Key? key,
      required this.historyElements,
      required this.onSelected,
      required this.filterType,})
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
        DropdownMenuItem(child: Text("Filter by " + widget.filterType), value: null),
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
  final List<HistoryElementModel> historyElements;

  const HistoryElement({Key? key, required this.historyElements}) : super(key: key);

  @override
  State<HistoryElement> createState() => _HistoryElementState();
}

class _HistoryElementState extends State<HistoryElement> {
  String? selectedUnit;
  String? selectedEventType;
  String? selectedPerson;
  List<HistoryElementModel>? filteredHistoryElements;
  List<HistoryElementModel>? originalHistoryElements;

  @override
  void initState() {
    super.initState();
    originalHistoryElements = List.from(widget.historyElements);
    filteredHistoryElements = List.from(widget.historyElements);
  }

  void onUnitSelected(String unit) {
    setState(() {
      selectedUnit = unit;
      filterHistoryElements();
    });
  }

  void onEventSelected(String event) {
    setState(() {
      selectedEventType = event;
      filterHistoryElements();
    });
  }

  void onPersonSelected(String person) {
    setState(() {
      selectedPerson = person;
      filterHistoryElements();
    });
  }

  void filterHistoryElements() {
    filteredHistoryElements = originalHistoryElements!
        .where((element) =>
    (selectedUnit == null || element.unit.name == selectedUnit) &&
        (selectedEventType == null || element.eventType.name == selectedEventType) &&
        (selectedPerson == null || element.personName == selectedPerson))
        .toList();
  }

  void resetFilters() {
    setState(() {
      selectedUnit = null;
      selectedEventType = null;
      selectedPerson = null;
      filteredHistoryElements = List.from(originalHistoryElements!);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HistoryPanelFilters(
            historyElements: widget.historyElements,
            onUnitSelected: onUnitSelected,
            onEventTypeSelected: onEventSelected,
            onPersonSelected: onPersonSelected,
            onResetFilters: resetFilters),
        Expanded(
          child: ListView.builder(
            itemCount: filteredHistoryElements!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredHistoryElements![index].unit.name),
                subtitle: Text(generateSubtitle(filteredHistoryElements![index])),
                trailing: Text(DateFormat('H:m:s d/M/y')
                    .format(filteredHistoryElements![index].date)),
              );
            },
          ),
        )
      ],
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
      default:
        return "Event: " + historyElement.eventType.toString();
    }
  }
}