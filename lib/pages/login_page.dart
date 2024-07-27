import 'package:flutter/material.dart';
import 'package:form_page/pages/signup_page.dart';
import 'package:form_page/providers/login_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<LoginPageProvider>(builder: (context, value, child) {
      return Scaffold(
          // backgroundColor: Colors.amberAccent,
          // appBar: AppBar(),
          body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(value.backImage), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 0),
                    child: Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 0.3,
                        ),
                      ),
                      elevation: 1,
                      color: Colors.white.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 60, horizontal: 18),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            "Login".text.xl4.white.medium.make(),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                              decoration: InputDecoration(
                                  label: "Email".text.white.make(),
                                  labelStyle: const TextStyle(fontSize: 22),
                                  suffixIcon:
                                      const Icon(Icons.mail_outline_rounded),
                                  suffixIconColor: Colors.white),
                            ),
                            TextFormField(
                              obscureText: value.visible,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                              decoration: InputDecoration(
                                  label: "Password".text.white.make(),
                                  labelStyle: const TextStyle(fontSize: 22),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      value.setVisible();
                                    },
                                    icon: value.visible
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                  ),
                                  suffixIconColor: Colors.white),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 8),
                                child: "Log In"
                                    .text
                                    .xl
                                    .medium
                                    .color(Colors.deepPurple)
                                    .make(),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Don't have an account ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    TextSpan(
                                      text: "REGISTER",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Define your navigation to the next page here
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignupPage()),
                                          );
                                        },
                                    )
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.imagesData.length,
                    itemBuilder: (context, index) {
                      final item = value.imagesData[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            value.setBackImage(item['image']);
                          },
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(item['image']),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }
}
