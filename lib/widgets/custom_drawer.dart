import 'package:flutter/material.dart';
import 'package:notes_app/pages/fav_notes_page.dart';
import 'package:notes_app/pages/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const SizedBox(
            height: 100,
            child: ListTile(
              tileColor: Colors.amber,
              textColor: Colors.white,
              title: Center(
                  child: Text(
                'Notes App',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FavNotesPage())),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('settings'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage())),
          ),
        ],
      ),
    );
  }
}
