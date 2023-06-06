import 'package:dictionary/res/dct_colors.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: DctColors.wWhite.withOpacity(0.6),
      child: const CircularProgressIndicator(
        color: DctColors.wRed,
      ),
    );
  }
}
