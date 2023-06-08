import 'package:dictionary/utils/base/state_notifier_mixin.dart';
import 'package:dictionary/utils/base_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract base class BaseStateNotifier extends AutoDisposeNotifier<BaseState>
    with StateNotifierMixin {}
