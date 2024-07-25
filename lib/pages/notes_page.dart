import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notes',
            style: TextStyle(fontSize: 36),
          ),
          actions: const [
            CustomIconButton(
              icon: Icon(
                Icons.search,
                size: 32,
              ),
              tooltip: 'Search Bar',
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(color: Colors.green),
                child: const Text('Hello'),
              );
            }));
  }
}
