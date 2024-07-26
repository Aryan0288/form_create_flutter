import 'package:flutter/material.dart';
import 'package:form_page/pages/login_page.dart';
import 'package:form_page/providers/login_page_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> LoginPageProvider())
      ],
      child:const MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
