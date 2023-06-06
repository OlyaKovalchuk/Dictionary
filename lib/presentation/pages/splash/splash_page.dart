import 'package:dictionary/res/dct_colors.dart';
import 'package:dictionary/res/dct_styles.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: DctColors.wRedGradient,
        ),
        child: Center(
          child: Text(
            context.strings.dictionary,
            style: DctStyles.h1WhiteBold44,
          ),
        ),
      ),
    );
  }
}
