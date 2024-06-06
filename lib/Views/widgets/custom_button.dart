import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const CustomButton({
    required this.onPressed,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          side: const BorderSide(color: Colors.green),
          fixedSize: const Size(230.0, 130.0),
          padding: const EdgeInsets.all(10.0),
          textStyle: const TextStyle(fontSize: 24.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Text(
        label,
        style: TextStyle(color: Colors.green),
      ),
    );
  }
}
