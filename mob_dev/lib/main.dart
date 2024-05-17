import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/email_list_bloc/email_list_cubit.dart';
import 'package:mob_dev/history_page.dart';
import 'package:mob_dev/home_bloc/home_cubit.dart';
import 'package:mob_dev/login_page.dart';
import 'package:mob_dev/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'authentication_bloc/authentication_cubit.dart';
import 'history_bloc/history_cubit.dart';
import 'home_page.dart';
import 'models/events/events_model.dart';

void main() async {
  final wsUrl = Uri.parse('ws://localhost:8181');
  final channel = WebSocketChannel.connect(wsUrl);

  runApp(
    MultiProvider(providers: [
      Provider<BroadcastWsChannel>(create: (_) => BroadcastWsChannel(wsUrl)),
      BlocProvider(create: (context) => AuthenticationCubit(context.read())),
    ],
        child: const MyApp(),
      ),
  );
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
        home: LoginPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[HistoryPage(), HomePage(), SettingsPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 200,
          title: Image.asset(
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
            label: 'history',
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

class BroadcastWsChannel {
  BroadcastWsChannel(Uri uri) : _channel = WebSocketChannel.connect(uri) {
     stream = _channel.stream
        .map((event) => jsonDecode(event))
        .map((event) => ServerEvent.fromJson(event))
        .asBroadcastStream();
  }

  final WebSocketChannel _channel;
  late Stream<ServerEvent> stream;

  WebSocketSink get sink => _channel.sink;
}
