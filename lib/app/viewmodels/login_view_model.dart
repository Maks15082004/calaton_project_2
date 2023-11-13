import 'package:calaton_project_2/app/login_factory.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginFactory _loginFactory;
  final GlobalKey<NavigatorState> navigatorKey;

  LoginViewModel(this._loginFactory, {required this.navigatorKey});

  String _username = '';
  String _password = '';
  bool _showErrorMessage = false;

  void setUsername(String username) {
    _username = username;
  }

  void setPassword(String password) {
    _password = password;
  }

  bool get showErrorMessage => _showErrorMessage;

  Future<void> login() async {
    // Simulate a 2-second delay
    await Future.delayed(Duration(seconds: 2));

    // Authenticate user
    final isAuthenticated = await _loginFactory.userRepository
        .authenticateUser(_username, _password);

    if (isAuthenticated) {
      // Save user data to local storage
      await _loginFactory.localStorage.saveUserData(_username, _password);

      // Navigate to home screen
      navigatorKey.currentState?.pushReplacementNamed('/home');
    } else {
      // Handle authentication failure
      _showErrorMessage = true;
      notifyListeners();
    }
  }

  Future<void> signUp() async {
    // Implement sign-up logic here
    final newUsername = _username;
    final newPassword = _password;

    // Save the new login credentials
    await _loginFactory.localStorage.saveUserData(newUsername, newPassword);

    // For simplicity, we'll update the hardcoded user in UserRepository
    _loginFactory.userRepository.updateUser(newUsername, newPassword);
  }
}
