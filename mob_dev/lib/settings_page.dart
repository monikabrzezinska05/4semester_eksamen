import 'package:flutter/material.dart';
import 'package:mob_dev/main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Enable dark mode: '),
            Switch(
                value: MyApp.themeNotifier.value == ThemeMode.dark,
                onChanged: (darkMode) {
                  setState(() {
                    MyApp.themeNotifier.value =
                        darkMode ? ThemeMode.dark : ThemeMode.light;
                  });
                },
                thumbIcon: thumbIcon,
            ),
          ],
        ),
      ],
    );
  }
}
