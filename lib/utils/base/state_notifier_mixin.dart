import 'dart:async';

import 'package:dictionary/utils/base_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin StateNotifierMixin on AutoDisposeNotifier<BaseState> {
  Future<void> futureHandle({
    required Future Function() func,
    required OnComplete onComplete,
    OnError? onError,
  }) async {
    state = ProgressState();
    try {
      final response = await func();

      state = await onComplete.call(response) ?? InitState();
    } catch (error, stackTrace) {
      state = onError != null
          ? await onError(error, stackTrace)
          : errorHandler(error, stackTrace);

      return;
    }
  }

  ErrorState errorHandler(Object error, StackTrace stackTrace) {
    if (error is FirebaseAuthException) {
      return ErrorState(
        title: error.toString(),
        message: error.message,
      );
    }

    return ErrorState(
      title: error.toString(),
      message: stackTrace.toString(),
    );
  }
}

typedef OnComplete = FutureOr<BaseState?> Function(Object? data);
typedef OnError = FutureOr<BaseState> Function(
  Object error,
  StackTrace stackTrace,
);
