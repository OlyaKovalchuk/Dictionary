import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/presentation/pages/bottom_nav_page.dart';
import 'package:dictionary/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:dictionary/presentation/pages/sign_in/state_notifier/sign_in_state.dart';
import 'package:dictionary/presentation/pages/sign_in/state_notifier/sign_in_state_notifier.dart';
import 'package:dictionary/presentation/pages/sign_up/sign_up_page.dart';
import 'package:dictionary/res/dct_styles.dart';
import 'package:dictionary/utils/base/base_page_state.dart';
import 'package:dictionary/utils/base_state.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:dictionary/utils/validators.dart';
import 'package:dictionary/widgets/auth_widgets/google_button.dart';
import 'package:dictionary/widgets/auth_widgets/or_widget.dart';
import 'package:dictionary/widgets/dct_app_bar.dart';
import 'package:dictionary/widgets/dct_elevated_button.dart';
import 'package:dictionary/widgets/dct_text_field.dart';
import 'package:dictionary/widgets/single_scroll_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  static const routeName = '/sign-in';

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends BasePageState<SignInPage, SignInStateNotifier> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtr = TextEditingController();
  final _passCtr = TextEditingController();

  @override
  AutoDisposeNotifierProvider<SignInStateNotifier, BaseState> stateProvider =
      ProviderInjector.signInStateProvider;

  @override
  void dispose() {
    _emailCtr.dispose();
    _passCtr.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void onStateListener(BaseState? prevState, BaseState nextState) {
    super.onStateListener(prevState, nextState);
    if (nextState is SignedInState) {
      context.pushNamedAndRemoveAll(BottomNavPage.routeName);
    }
  }

  @override
  Widget bodyWidget(BuildContext context) {
    final strings = context.strings;

    return SafeArea(
      child: Scaffold(
        appBar: DctAppBar(
          canPop: context.canPop(),
          child: Text(
            strings.dictionary,
            style: DctStyles.b2WhiteSemiBold16Futura,
          ),
        ),
        body: SingleScrollWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    strings.signInToYourAccount,
                    style: DctStyles.h3GradiantSemiBold21,
                  ),
                ),
                const SizedBox(height: 22),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// Email field
                      DctTextField(
                        controller: _emailCtr,
                        hintText: strings.enterYourEmail,
                        validator: Validators.validateEmail,
                      ),
                      const SizedBox(height: 16),

                      /// Password field
                      DctTextField(
                        controller: _passCtr,
                        hintText: strings.enterYourPassword,
                        enableInteractiveSelection: false,
                        validator: Validators.validatePassword,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: _moveToForgotPasswordPage,
                    child: Text(
                      strings.forgotPassword,
                      style: DctStyles.b2GradientRegular14Futura,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DctElevatedButton(
                    text: strings.signIn,
                    onPressed: _signInWithEmail,
                  ),
                ),
                const SizedBox(height: 4),

                /// OR text
                const OrWidget(),
                const SizedBox(height: 4),

                /// Sign up with Google btn
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GoogleButton(
                    title: strings.signInWithGoogle,
                    onPressed: _signInWithGoogle,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      strings.dontHaveAnAccount,
                      style: DctStyles.b3GreySemiBold14,
                    ),
                    TextButton(
                      onPressed: _moveToSignUp,
                      child: Text(strings.signUp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signInWithGoogle() =>
      ref.read(stateProvider.notifier).signInWithGoogle();

  void _signInWithEmail() {
    final isFormValid = _formKey.currentState?.validate();
    if (isFormValid == true) {
      ref.read(stateProvider.notifier).signInWithEmail(
            email: _emailCtr.text.trim(),
            password: _passCtr.text.trim(),
          );
    }
  }

  void _moveToSignUp() => context.pushReplacementNamed(SignUpPage.routeName);

  void _moveToForgotPasswordPage() =>
      context.pushNamed(ForgotPasswordPage.routeName);
}
