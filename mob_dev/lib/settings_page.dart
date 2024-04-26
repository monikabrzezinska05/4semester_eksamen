import 'package:flutter/material.dart';
import 'package:mob_dev/main.dart';
import 'package:email_validator/email_validator.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.items});

  final List<String> items;

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
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          child: Row(
            children: [
              Text('Enable dark mode: ', style: TextStyle(fontSize: 22)),
              const Spacer(),
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14.5, right: 14.5, top: 10),
          child: ExpansionTile(
            title: Text("Colour codes", style: TextStyle(fontSize: 22)),
            children: <Widget>[
              ListTile(
                title: Row(
                  children: [
                    Text('Green indicates alarm is armed'),
                    const Spacer(),
                    Icon(Icons.circle, color: Colors.green, size: 15),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Text('Yellow indicates a unit is open'),
                    const Spacer(),
                    Icon(Icons.circle, color: Colors.yellow, size: 15),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Text('Red indicates alarm is triggered'),
                    const Spacer(),
                    Icon(Icons.circle, color: Colors.red, size: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14.5, right: 14.5, top: 10),
          child: CustomExpansionTile(
            items: widget.items,
          ),
        ),
      ],
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final List<String> items;

  CustomExpansionTile({required this.items});

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Alarm Email List", style: TextStyle(fontSize: 22)),
      children: widget.items.map((item) {
        return ListTile(
          title: Text(item),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                widget.items.remove(item);
              });
            },
          ),
        );
      }).toList()
        ..add(
          ListTile(
            title: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter new item',
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(
                  () {
                    if (EmailValidator.validate(_controller.text)) {
                      widget.items.add(_controller.text);
                      _controller.clear();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Invalid email address'),
                            content: Text('Please enter a valid email address'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                );
              },
            ),
          ),
        ),
    );
  }
}
