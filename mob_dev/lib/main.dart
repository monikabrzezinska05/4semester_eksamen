import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/email_list_bloc/settings_cubit.dart';
import 'package:mob_dev/history_page.dart';
import 'package:mob_dev/home_bloc/home_cubit.dart';
import 'package:mob_dev/login_page.dart';
import 'package:mob_dev/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'authentication_bloc/authentication_cubit.dart';
import 'firebase_options.dart';
import 'history_bloc/history_cubit.dart';
import 'home_page.dart';
import 'models/events/events_model.dart';

void main() async {
  final wsUrl = Uri.parse('ws://10.0.2.2:8181');
  final channel = WebSocketChannel.connect(wsUrl);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      ValueNotifier(ThemeMode.system);

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
