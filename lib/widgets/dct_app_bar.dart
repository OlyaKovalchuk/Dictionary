import 'package:dictionary/res/dct_colors.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class DctAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DctAppBar({
    required this.child,
    this.canPop = false,
    super.key,
  });

  final Widget child;
  final bool canPop;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: DctColors.wRedGradient,
      ),
      child: Stack(
        children: [
          if (canPop)
            IconButton(
              visualDensity: const VisualDensity(vertical: 4),
              onPressed: context.pop,
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 16,
              ),
              color: DctColors.wWhite,
            ),
          Center(child: child),
        ],
      ),
    );
  }
}
