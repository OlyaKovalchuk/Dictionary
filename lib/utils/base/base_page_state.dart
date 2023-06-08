import 'package:dictionary/utils/base/base_state_notifier.dart';
import 'package:dictionary/utils/base_state.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:dictionary/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BasePageState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  abstract AutoDisposeNotifierProvider<BaseStateNotifier, BaseState>
      stateProvider;

  final _isProgress = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isProgress.dispose();
    super.dispose();
  }

// TODO: think about a better solution for showing progress
  @mustCallSuper
  void onStateListener(BaseState? prevState, BaseState nextState) {
    if (nextState is ProgressState) {
      _isProgress.value = true;

      return;
    } else if (nextState is ErrorState) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(context.strings.error),
          content: Text(nextState.message ?? ''),
          actions: [
            TextButton(
              onPressed: context.pop,
              child: Text(context.strings.ok),
            ),
          ],
        ),
      );
    }
    _isProgress.value = false;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(stateProvider, onStateListener);

    return Stack(
      children: [
        Builder(builder: bodyWidget),
        ValueListenableBuilder(
          valueListenable: _isProgress,
          //ignore: prefer-trailing-comma
          builder: (context, isProgressState, _) => isProgressState
              ? const ProgressWidget()
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget bodyWidget(BuildContext context);
}
