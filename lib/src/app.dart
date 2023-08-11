import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import 'package:login_bloc/src/pages/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const MaterialApp(
        title: 'Login',
        home: Scaffold(
          body: LoginPage(),
        ),
      ),
    );
  }
}
