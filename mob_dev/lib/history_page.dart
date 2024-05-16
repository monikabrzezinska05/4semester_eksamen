import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mob_dev/history_bloc/history_state.dart';
import 'package:mob_dev/main.dart';

import 'history_bloc/history_cubit.dart';
import 'models/history/history_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryCubit>(
      create: (context) {
        final channel = context.read<BroadcastWsChannel>();
        return HistoryCubit(channel)..init();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('history'),
        ),
        body: Column(
          children: [
            Expanded(
              child: HistoryElement(),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryPanelFilters extends StatelessWidget {

  const HistoryPanelFilters(
      {super.key});

  @override
  Widget build(BuildContext context) {
  final cubit = context.watch<HistoryCubit>();
  final state = cubit.state;
    return ExpansionTile(
      title: const Text("Filters"),
      children: [
        Row(
          children: [
            Spacer(),
            Spacer(),
            HistoryDropdownMenus(
                historyElements: state.units,
                onSelected: cubit.onUnitSelected,
                filterType: 'unit',
                dropdownValue: state.selectedUnit),
            Spacer(),
            HistoryDropdownMenus(
                historyElements: state.eventTypes,
                onSelected: cubit.onEventTypeSelected,
                filterType: 'event',
                dropdownValue: state.selectedEventType),
            Spacer(),
            HistoryDropdownMenus(
                historyElements: state.persons,
                onSelected: cubit.onPersonSelected,
                filterType: 'person',
                dropdownValue: state.selectedPerson
            ),
            Spacer(),
            ElevatedButton(onPressed: cubit.resetFilters, child: Text("Reset"))
          ],
        ),
      ],
    );
  }
}

class HistoryDropdownMenus extends StatelessWidget {
  final List<String> historyElements;
  final ValueChanged<String> onSelected;
  final String filterType;
  final String dropdownValue;

  HistoryDropdownMenus(
      {Key? key,
      required this.historyElements,
      required this.onSelected,
      required this.filterType,
      required this.dropdownValue})
      : super(key: key);

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
        onSelected(value!);
      },
      items: [
        DropdownMenuItem(child: Text("Filter by " + filterType), value: ''),
        ...historyElements.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList()
      ],
    );
  }
}

class HistoryElement extends StatelessWidget {

  const HistoryElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final shownHistory = context.watch<HistoryCubit>().state.shownHistory;
    return Column(
        children: [
          HistoryPanelFilters(),
          Expanded(
            child: ListView.builder(
              itemCount: shownHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(shownHistory[index].unit.name),
                  subtitle: Text(generateSubtitle(shownHistory[index])),
                  trailing: Text(DateFormat('H:m:s d/M/y')
                      .format(shownHistory[index].date)),
                );
              },
            ),
          )
        ],
      );
  }

  String generateSubtitle(HistoryModel historyElement) {
    switch (historyElement.eventType) {
      case EventType.AlarmStopped:
        return "Alarm stopped by ${historyElement.personName}" ;
      case EventType.AlarmArmed:
        return "Alarm armed by ${historyElement.personName}" ;
      case EventType.AlarmDisarmed:
        return "Alarm disarmed by ${historyElement.personName}" ;
      default:
        return "Event: " + historyElement.eventType.toString();
    }
  }
}