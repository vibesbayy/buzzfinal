import 'package:flutter/material.dart';

class WhatsApp extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;

  const WhatsApp({
    super.key,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? Colors.white : Colors.black.withOpacity(0.6),
          foregroundColor: isSelected ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text('WhatsApp'),
      ),
    );
  }
}