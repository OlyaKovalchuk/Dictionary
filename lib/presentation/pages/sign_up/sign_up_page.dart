import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/generated/assets.dart';
import 'package:dictionary/presentation/pages/bottom_nav_page.dart';
import 'package:dictionary/presentation/pages/sign_up/state_notifier/sign_up_state.dart';
import 'package:dictionary/res/dct_styles.dart';
import 'package:dictionary/utils/base_state.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:dictionary/utils/validators.dart';
import 'package:dictionary/widgets/dct_app_bar.dart';
import 'package:dictionary/widgets/dct_elevated_button.dart';
import 'package:dictionary/widgets/dct_text_field.dart';
import 'package:dictionary/widgets/progress_widget.dart';
import 'package:dictionary/widgets/single_scroll_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

// TODO: Create abstractions for listening state and showing progress and error.
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/sign-up';

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtr = TextEditingController();
  final _nameCtr = TextEditingController();
  final _passCtr = TextEditingController();
  final _isProgress = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _emailCtr.dispose();
    _nameCtr.dispose();
    _passCtr.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    ref.listen(ProviderInjector.signUpStateProvider, _onStateListener);

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: DctAppBar(
              canPop: context.canPop(),
              child: Text(
                strings.dictionary,
                style: DctStyles.b2WhiteSemiBold16Futura,
              ),
            ),
            body: SingleScrollWidget(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
          ValueListenableBuilder(
            valueListenable: _isProgress,
            builder: (context, isProgressState, _) => isProgressState
                ? const ProgressWidget()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  void _onStateListener(_, BaseState state) {
    if (state is SignedUpState) {
      context.pushNamedAndRemoveAll(BottomNavPage.routeName);
    } else if (state is ProgressState) {
      _isProgress.value = true;

      return;
    } else if (state is ErrorState) {
      _isProgress.value = false;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(context.strings.error),
          content: Text(state.message ?? ''),
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
