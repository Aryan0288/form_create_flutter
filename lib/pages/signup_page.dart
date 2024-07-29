import 'package:flutter/material.dart';
import 'package:form_page/pages/login_page.dart';
// import 'package:form_page/pages/signup_page.dart';
import 'package:form_page/providers/login_page_provider.dart';
import 'package:form_page/styles/background_images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  void submitHandler() {
    print("register page");
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
      return;
    }
    print("continue......");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<LoginPageProvider>(builder: (context, value, child) {
      return Scaffold(
          // backgroundColor: Colors.amberAccent,

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
                            Text("Register",style: GoogleFonts.actor(fontWeight: FontWeight.bold,fontSize: 36,color: Colors.white),),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                                key: formKey,
                                child: Column(children: [
                                  TextFormField(
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    decoration: InputDecoration(
                                        label: "Name".text.white.make(),
                                        labelStyle:
                                            const TextStyle(fontSize: 22),
                                        suffixIcon: const Icon(Icons.person),
                                        suffixIconColor: Colors.white),
                                    validator: (value) {
                                      if (value.isEmptyOrNull) {
                                        return "Name is required";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    decoration: InputDecoration(
                                        label: "Email".text.white.make(),
                                        labelStyle:
                                            const TextStyle(fontSize: 22),
                                        suffixIcon: const Icon(
                                            Icons.mail_outline_rounded),
                                        suffixIconColor: Colors.white),
                                    validator: (value) {
                                      if (value.isEmptyOrNull) {
                                        return "Email is required";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    obscureText: value.visible,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    decoration: InputDecoration(
                                        label: "Password".text.white.make(),
                                        labelStyle:
                                            const TextStyle(fontSize: 22),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            value.setVisible();
                                          },
                                          icon: value.visible
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                                  Icons.visibility_off),
                                        ),
                                        suffixIconColor: Colors.white),
                                    validator: (value) {
                                      if (value.isEmptyOrNull) {
                                        return "Password is required";
                                      } else if (value!.length < 6) {
                                        return "Password length should 6";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        submitHandler();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          elevation: 8),
                                      child: "Sign Up"
                                          .text
                                          .xl
                                          .medium
                                          .color(Colors.deepPurple)
                                          .make(),
                                    ),
                                  ),
                                ])),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Don't have an account ",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    TextSpan(
                                      text: "Login",
                                      style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w500),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Define your navigation to the next page here
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()),
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
                const BackgroundImages()
              ],
            ),
          ),
        ),
      ));
    });
  }
}
