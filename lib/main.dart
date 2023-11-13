import 'package:calaton_project_2/app/screens/home/home_page_screen.dart';
import 'package:calaton_project_2/app/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/login_factory.dart';
import 'app/screens/login/login_screen.dart';
import 'app/service/local_storage.dart';
import 'data/repositories/user_repository.dart';

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  runApp(MyApp(navigatorKey: navigatorKey));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(
            LoginFactory(LocalStorage(), UserRepository()),
            navigatorKey: navigatorKey,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Your App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        navigatorKey: navigatorKey,
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
