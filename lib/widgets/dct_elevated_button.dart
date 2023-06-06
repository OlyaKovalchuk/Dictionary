import 'package:dictionary/res/dct_colors.dart';
import 'package:flutter/material.dart';

class DctElevatedButton extends StatelessWidget {
  const DctElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: DctColors.wRedGradient,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
