import 'package:dictionary/domains/provider_injector.dart';
import 'package:dictionary/presentation/pages/splash/splash_page.dart';
import 'package:dictionary/utils/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavPage extends ConsumerWidget {
  const BottomNavPage({super.key});

  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bottom navigation page'),
          ElevatedButton(
            onPressed: () => _signOut(context, ref),
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    await ref.read(ProviderInjector.authProvider).logout();
    await context.pushNamedAndRemoveAll(SplashPage.routeName);
  }
}
