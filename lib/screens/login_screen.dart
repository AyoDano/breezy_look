import 'package:breezy_look/screens/app_navigationbar.dart';
import 'package:breezy_look/screens/signup_screen.dart';
import 'package:breezy_look/utils/ui/widgets/button_no_icon.dart';
import 'package:breezy_look/utils/ui/widgets/terms_and_privacy_text.dart';
import 'package:breezy_look/utils/ui/widgets/textfield_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AppNavigation()),
        );
      } on FirebaseAuthException catch (e) {
        String message = 'Login failed';
        if (e.code == 'user-not-found') {
          message = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password provided.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${e.toString()}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 70),
                  child: Image.asset(
                    "assets/icons/app_icon/icon_breezylook_transparent.png",
                    fit: BoxFit.contain,
                    width: 150,
                  ),
                ),
              ),
              EmailFieldWithLabel(
                label: "Email",
                placeholder: "Example@mail.com",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              PasswordFieldWithLabel(
                label: "Password",
                placeholder: "Use a strong password",
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a password";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: [
                    IconlessButtonWidget(
                      text: "Login",
                      onPressed: _login,
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SignUpScreen('Sign Up'),
                          ),
                        );
                      },
                      child: Text(
                        "No account? Register here",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TermsAndPrivacyText(),
            ],
          ),
        ),
      ),
    );
  }
}
