import 'package:dictionary/res/dct_styles.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlreadyHaveAnAccountWidget extends ConsumerWidget {
  const AlreadyHaveAnAccountWidget({
    required this.onSignInTapped,
    super.key,
  });

  final VoidCallback onSignInTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.strings.alreadyHaveAnAccount,
          style: DctStyles.b3GreySemiBold14,
        ),
        TextButton(
          onPressed: onSignInTapped,
          child: Text(context.strings.signIn),
        ),
      ],
    );
  }
}
