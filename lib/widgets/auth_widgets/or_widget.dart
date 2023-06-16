import 'package:dictionary/res/dct_styles.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            context.strings.or,
            style: DctStyles.b2GradientRegular14,
          ),
        ),
        const Flexible(
          child: Divider(),
        ),
      ],
    );
  }
}
