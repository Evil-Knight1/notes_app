import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TextField(
            decoration: InputDecoration(
                hintText: 'Enter the Title', border: OutlineInputBorder()),
          ),
          const TextField(
            decoration: InputDecoration(
                hintText: 'Enter the Title', border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(),
              child: const Text('Save')),
        ],
      ),
    );
  }
}