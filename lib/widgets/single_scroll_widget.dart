import 'package:flutter/widgets.dart';

class SingleScrollWidget extends StatelessWidget {
  const SingleScrollWidget({
    this.child,
    super.key,
    this.isMaxHeight = true,
    this.isMaxWidth = true,
    this.scrollController,
  });

  final Widget? child;
  final bool isMaxHeight;
  final bool isMaxWidth;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) =>
          SingleChildScrollView(
        controller: scrollController,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: isMaxHeight
                ? viewportConstraints.maxHeight
                : viewportConstraints.minHeight,
            minWidth: viewportConstraints.maxWidth,
          ),
          child: IntrinsicHeight(child: child),
        ),
      ),
    );
  }
}
