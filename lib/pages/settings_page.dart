import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';

import 'package:notes_app/service/setting_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool value;
  @override
  void initState() {
    value = SettingsService.loadThemeMode() ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SwitchListTile.adaptive(
              title: const Text('Dark Mode'),
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val;
                  BlocProvider.of<NotesCubit>(context).changeTheme();
                });
                SettingsService.saveThemeMode(val);
              }),
        ],
      ),
    );
  }
}
