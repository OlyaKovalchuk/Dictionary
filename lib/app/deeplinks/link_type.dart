import 'package:dictionary/presentation/pages/reset_password/reset_password_page.dart';

enum LinkType {
  resetPassword('reset-password');

  const LinkType(this.actionName);

  final String actionName;

  String getRouteName() {
    switch (this) {
      case LinkType.resetPassword:
        return ResetPasswordPage.routeName;
    }
  }
}
