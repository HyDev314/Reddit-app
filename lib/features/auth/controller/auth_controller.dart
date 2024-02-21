import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone_master/core/utils.dart';
import 'package:reddit_clone_master/features/auth/models/user_model.dart';
import 'package:reddit_clone_master/features/auth/repository/auth_repositosy.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authRepositosy: ref.watch(authRepositosyProvider),
    ref: ref,
  ),
);

final authStatechangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  final AuthRepositosy _authRepositosy;
  final Ref _ref;

  AuthController({
    required AuthRepositosy authRepositosy,
    required Ref ref,
  })  : _authRepositosy = authRepositosy,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _authRepositosy.authStateChange;

  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepositosy.signInWithGoogle();
    user.fold(
        (l) => showSnackBar(context, l.message),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepositosy.getUserData(uid);
  }

  void logout() async {
    _authRepositosy.logOut();
  }
}
