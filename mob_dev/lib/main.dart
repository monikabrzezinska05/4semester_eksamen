import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mob_dev/history_page.dart';
import 'package:mob_dev/settings_page.dart';

import 'firebase_options.dart';
import 'home_page.dart';
import 'models/history_element_model.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.dark);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) => MaterialApp(
        title: 'Securty',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          dividerTheme: const DividerThemeData(color: Colors.black),
        ),
        darkTheme: ThemeData(
            dividerTheme: const DividerThemeData(color: Colors.white),
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, brightness: Brightness.dark)),
        themeMode: themeMode,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> headline = ['MaserUnit 1', 'MasterUnit 2', 'MsterUnit 3'];
  final List<String> underheadlines = ['Unit 1', 'Unit 2', 'Unit 3'];
  final List<HistoryElementModel> historyElements = [
    HistoryElementModel(
      historyId: 1,
      unitName: 'MasterUnit 1',
      eventType: EventType.AlarmArmed,
      personName: 'John Doe',
      date: DateTime.now(),
    ),
    HistoryElementModel(
      historyId: 2,
      unitName: 'MasterUnit 1',
      eventType: EventType.AlarmDisarmed,
      personName: 'John Doe',
      date: DateTime.now(),
    ),
    HistoryElementModel(
      historyId: 3,
      unitName: 'MasterUnit 1',
      eventType: EventType.AlarmStopped,
      personName: 'John Doe',
      date: DateTime.now(),
    ),
    HistoryElementModel(
      historyId: 3,
      unitName: 'MasterUnit 1',
      eventType: EventType.AlarmStopped,
      personName: 'John Doe',
      date: DateTime.now(),
    ),
  ];
  int _selectedIndex = 1;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HistoryPage(
        historyElements: historyElements,
      ),
      HomePage(headline: headline, underheadlines: underheadlines),
      SettingsPage(items: ['Item 1', 'Item 2', 'Item 3'])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 200,
          title: Image.network(
            "assets/securty_logo.png",
            fit: BoxFit.cover,
            height: 200,
            width: 200,
          )),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
