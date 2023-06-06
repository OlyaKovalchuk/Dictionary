import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/generated/assets.dart';
import 'package:dictionary/presentation/pages/sign_in/sign_in_page.dart';
import 'package:dictionary/presentation/pages/sign_up/sign_up_page.dart';
import 'package:dictionary/res/dct_styles.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:dictionary/widgets/dct_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroductionPage extends ConsumerWidget {
  const IntroductionPage({super.key});

  static const routeName = '/introduction';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.strings.hello,
                style: DctStyles.h2GradientBold36,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                context.strings.intructionText,
                style: DctStyles.b2BlackRegular14Roboto,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SvgPicture.asset(Assets.imagesIntroductionImage),
              const Spacer(),
              DctElevatedButton(
                onPressed: () => _createAccountTapped(context, ref),
                text: context.strings.createAnAccount,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.strings.alreadyHaveAnAccount,
                    style: DctStyles.b3GreySemiBold12,
                  ),
                  TextButton(
                    onPressed: () => _signInTapped(context, ref),
                    child: Text(context.strings.signIn),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createAccountTapped(BuildContext context, WidgetRef ref) {
    ref.read(ProviderInjector.sharedPrefsProvider).finishIntroduction();
    context.pushNamedAndRemoveAll(SignUpPage.routeName);
  }

  void _signInTapped(BuildContext context, WidgetRef ref) {
    ref.read(ProviderInjector.sharedPrefsProvider).finishIntroduction();
    context.pushNamedAndRemoveAll(SignInPage.routeName);
  }
}
