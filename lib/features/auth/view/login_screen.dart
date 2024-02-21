import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone_master/core/common/loader.dart';
import 'package:reddit_clone_master/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone_master/features/auth/view/widgets/sign_in_button_widget.dart';
import 'package:reddit_clone_master/core/constants/constants.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          Constants.appLogo,
          height: 40,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const LoaderScreen()
          : Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Dive into anything',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(Constants.loginEmo),
                ),
                const SizedBox(height: 30),
                const SignInButtonWidget(),
              ],
            ),
    );
  }
}
