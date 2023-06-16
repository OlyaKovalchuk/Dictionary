import 'package:dictionary/presentation/pages/bottom_nav_page.dart';
import 'package:dictionary/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:dictionary/presentation/pages/introduction/introduction_page.dart';
import 'package:dictionary/presentation/pages/reset_password/reset_password_page.dart';
import 'package:dictionary/presentation/pages/sign_in/sign_in_page.dart';
import 'package:dictionary/presentation/pages/sign_up/sign_up_page.dart';
import 'package:dictionary/presentation/pages/splash/splash_page.dart';

// ignore: avoid_classes_with_only_static_members
class AppRoutes {
  static final routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    IntroductionPage.routeName: (context) => const IntroductionPage(),
    SignInPage.routeName: (context) => const SignInPage(),
    SignUpPage.routeName: (context) => const SignUpPage(),
    BottomNavPage.routeName: (context) => const BottomNavPage(),
    ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
    ResetPasswordPage.routeName: (context) => const ResetPasswordPage(),
  };
}
