import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitterx/features/auth/data/provides/auth_provider.dart';

class AuthRepo {
  final AuthDataProvider authProvider;

  AuthRepo({required this.authProvider});

  Future<UserCredential> signup(String email, String password) async {
    try {
      UserCredential user = await authProvider.signup(email, password);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential user = await authProvider.login(email, password);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await authProvider.logout();
    } catch (e) {
      rethrow;
    }
  }
}