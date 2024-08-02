import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CustomBlockColorPicker extends StatelessWidget {
  const CustomBlockColorPicker({
    super.key,
    required this.onColorChanged,
  });
  final void Function(Color) onColorChanged;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick a Color'),
      content: BlockPicker(
        pickerColor: Colors.white,
        onColorChanged: onColorChanged,
      ),
      actions: [
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.done,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
