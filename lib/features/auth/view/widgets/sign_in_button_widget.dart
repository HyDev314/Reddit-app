import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone_master/core/constants/constants.dart';
import 'package:reddit_clone_master/themes/pallete.dart';
import 'package:reddit_clone_master/features/auth/controller/auth_controller.dart';

class SignInButtonWidget extends ConsumerWidget {
  const SignInButtonWidget({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(context, ref),
        icon: Image.asset(
          Constants.googleLogo,
          height: 35,
        ),
        label: const Text(
          'Continue with Google',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.greyColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )),
      ),
    );
  }
}
