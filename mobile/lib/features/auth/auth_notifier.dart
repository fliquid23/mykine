import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class AuthState { const AuthState(); }
class Unauthenticated extends AuthState { const Unauthenticated(); }
class Loading extends AuthState { const Loading(); }
class Authenticated extends AuthState { final String token; const Authenticated(this.token); }

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const Unauthenticated());

  Future<void> login(String email, String password) async {
    state = const Loading();
    await Future.delayed(const Duration(milliseconds: 300));
    state = const Authenticated('demo-token'); // TODO: integrar con API real
  }

  void logout() => state = const Unauthenticated();
}
