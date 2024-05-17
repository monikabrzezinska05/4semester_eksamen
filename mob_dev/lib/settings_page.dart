import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/email_list_bloc/email_list_cubit.dart';
import 'package:mob_dev/main.dart';
import 'package:email_validator/email_validator.dart';

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
    final channel = context.read<BroadcastWsChannel>();
    return BlocProvider(create: (context) => EmailListCubit(channel)..init(),
      child: ListView(
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
            child: CustomExpansionTile(),
          ),
        ],
      ),
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<EmailListCubit>();
    final state = cubit.state;
    return ExpansionTile(
      title: Text("Alarm Email List", style: TextStyle(fontSize: 22)),
      children: state.allEmails.map((item) {
        return ListTile(
          title: Text(item.mail),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              context.read<EmailListCubit>().removeEmail(item.id);
            },
          ),
        );
      }).toList()
        ..add(
          ListTile(
            title: TextFormField(
              controller: _controller,
              validator: (value) => EmailValidator.validate(value ?? "")
                  ? null
                  : "Invalid email address",
              decoration: InputDecoration(
                hintText: 'Enter new item',
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                if (EmailValidator.validate(_controller.text)) {
                  cubit.addEmail(_controller.text);
                  _controller.clear();
                }
              },
            ),
          ),
        ),
    );
  }
}