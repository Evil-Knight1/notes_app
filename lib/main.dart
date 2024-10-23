import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/pages/notes_page.dart';
import 'package:notes_app/service/setting_service.dart';
import 'package:notes_app/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NotesModelAdapter());

  await Hive.openBox<NotesModel>(kNotesBox).then((value) {
    for (var box in value.values) {
      if (box.fav == null) {
        box.fav = false;
        box.save();
      }
    }
  });
  await Hive.openBox<bool>(kUserSettings);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocBuilder<NotesCubit, NoteState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: SettingsService.loadThemeMode()!
                ? ThemeMode.dark
                : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light().copyWith(),
            home: const NotesPage(),
          );
        },
      ),
    );
  }
}
