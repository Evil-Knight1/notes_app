import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.text, this.onPressed, this.isLoading = false});
  final String text;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child:isLoading ? const CircularProgressIndicator(
            
          ): Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          )),
    );
  }
}
