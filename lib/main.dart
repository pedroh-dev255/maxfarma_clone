import 'package:flutter/material.dart';
//pages
import 'pages/login/login.page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaxFarma_Clone',
      home: LoginPage(),
    );
  }
}
