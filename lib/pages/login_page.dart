import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) {
      return Scaffold(
        backgroundColor:const Color(0xff1C1760),
        // appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BackdropFilter(
                filter:  ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Card(
                  
                  shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  // side:const BorderSide(
                  //   // color: Colors.white,
                  //   // width: 2.0,
                  // ),
                ),
                  elevation: 0,
                  color: Colors.grey.withOpacity(0.09),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 60, horizontal: 18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        "Login".text.xl4.white.medium.make(),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: "Email".text.xl2.white.make(),
                            suffixIcon:const Icon(Icons.mail_outline_rounded),
                            suffixIconColor: Colors.white
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: "Password".text.xl2.white.make(),
                            suffixIcon: const Icon(Icons.lock_outline_rounded),
                            suffixIconColor: Colors.white
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: "Log In".text.xl.medium.color(Colors.deepPurple).make(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 8
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
