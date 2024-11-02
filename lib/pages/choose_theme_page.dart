import 'package:flutter/material.dart';
import 'package:notes_app/pages/notes_page.dart';
import 'package:notes_app/service/setting_service.dart';

class ChooseThemePage extends StatelessWidget {
  const ChooseThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                title: const Text('Light Theme'),
                onTap: () {
                  SettingsService.saveThemeMode(false);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotesPage()));
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                title: const Text(
                  'Dark Theme',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  SettingsService.saveThemeMode(true);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotesPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
