import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffffcd7a),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            onTap: () {},
            title: const Text(
              'Flutter Tip',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                'Build your carer with tharwat samy',
                style: TextStyle(fontSize: 18, color: Colors.black45),
              ),
            ),
            trailing: const CustomIconButton(
              icon: Icon(
                FontAwesomeIcons.trash,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 24),
            child: Text(
              '20 may 2024',
              style: TextStyle(color: Colors.black38, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
