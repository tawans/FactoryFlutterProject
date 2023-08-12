import 'package:actual/user/view/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const _App(),
  );
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: 'NotoSans',
      ),
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: LoginScreen(),
      ),
    );
  }
}
