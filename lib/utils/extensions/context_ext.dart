import 'package:dictionary/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

extension ContextExt on BuildContext {
  S get strings => S.of(this);

  void pop() => Navigator.of(this).pop();

  bool canPop() => Navigator.canPop(this);

  Future<T?> pushNamedAndRemoveAll<T extends Object?>(
    String routeName, [
    Object? arguments,
  ]) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        routeName,
        (route) => false,
        arguments: arguments,
      );

  Future<T?> pushReplacementNamed<T extends Object?>(String routeName) =>
      Navigator.pushReplacementNamed(this, routeName);
}
