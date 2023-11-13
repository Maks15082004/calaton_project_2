import 'package:calaton_project_2/app/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => viewModel.setUsername(value),
              decoration: InputDecoration(labelText: 'New Username'),
            ),
            TextField(
              onChanged: (value) => viewModel.setPassword(value),
              decoration: InputDecoration(labelText: 'New Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await viewModel.signUp();
                Navigator.pop(
                    context); // Повернення на попередній екран (Login)
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
