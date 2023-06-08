import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/generated/assets.dart';
import 'package:dictionary/presentation/pages/bottom_nav_page.dart';
import 'package:dictionary/presentation/pages/sign_up/state_notifier/sign_up_state.dart';
import 'package:dictionary/res/dct_styles.dart';
import 'package:dictionary/utils/base/base_page_state.dart';
import 'package:dictionary/utils/base/base_state_notifier.dart';
import 'package:dictionary/utils/base_state.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:dictionary/utils/validators.dart';
import 'package:dictionary/widgets/dct_app_bar.dart';
import 'package:dictionary/widgets/dct_elevated_button.dart';
import 'package:dictionary/widgets/dct_text_field.dart';
import 'package:dictionary/widgets/single_scroll_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/sign-up';

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtr = TextEditingController();
  final _nameCtr = TextEditingController();
  final _passCtr = TextEditingController();

  @override
  AutoDisposeNotifierProvider<BaseStateNotifier, BaseState> stateProvider =
      ProviderInjector.signUpStateProvider;

  @override
  void dispose() {
    _emailCtr.dispose();
    _nameCtr.dispose();
    _passCtr.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void onStateListener(BaseState? prevState, BaseState nextState) {
    super.onStateListener(prevState, nextState);
    if (nextState is SignedUpState) {
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
                    strings.createANewAccount,
                    style: DctStyles.h3GradiantSemiBold21,
                  ),
                ),
                const SizedBox(height: 22),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// Name field
                      DctTextField(
                        controller: _nameCtr,
                        hintText: strings.enterYourName,
                        validator: Validators.validateName,
                      ),
                      const SizedBox(height: 16),

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
                const SizedBox(height: 22),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DctElevatedButton(
                    text: strings.signUp,
                    onPressed: _signUp,
                  ),
                ),
                const SizedBox(height: 4),

                /// OR text
                Row(
                  children: [
                    const Flexible(
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        strings.or,
                        style: DctStyles.b2GradientRegular14,
                      ),
                    ),
                    const Flexible(
                      child: Divider(),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                /// Sign up with Google btn
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: OutlinedButton(
                    onPressed: _signUpWithGoogle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.iconsGoogleIc),
                        const SizedBox(width: 4),
                        Text(strings.signUpWithGmail),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() {
    final isFormValid = _formKey.currentState?.validate();
    if (isFormValid == true) {
      ref.read(ProviderInjector.signUpStateProvider.notifier).signUpWithEmail(
            name: _nameCtr.text.trim(),
            email: _emailCtr.text.trim(),
            password: _passCtr.text.trim(),
          );
    }
  }

  void _signUpWithGoogle() {
    ref.read(ProviderInjector.authProvider).signInWithGoogle();
  }
}
