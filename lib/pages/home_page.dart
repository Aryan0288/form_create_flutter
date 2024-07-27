import 'package:flutter/material.dart';
import 'package:form_page/providers/login_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginPageProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              "home page".text.make()
            ],
          ),
        ),
      );
    });
  }
}
