import 'package:calaton_project_2/app/screens/signup/sign_up_screen.dart';
import 'package:calaton_project_2/app/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => viewModel.setUsername(value),
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              onChanged: (value) => viewModel.setPassword(value),
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await viewModel.login();
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text('Sign Up'),
            ),
            if (viewModel.showErrorMessage)
              Text(
                'Invalid username or password',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
