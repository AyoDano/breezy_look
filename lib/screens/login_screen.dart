import 'package:breezy_look/modules/data/repositories/mock_database.dart';
import 'package:breezy_look/screens/placeholder_screen_user.dart';
import 'package:breezy_look/screens/signin_screen.dart';
import 'package:breezy_look/utils/ui/widgets/button_no_icon.dart';
import 'package:breezy_look/utils/ui/widgets/terms_and_privacy_text.dart';
import 'package:breezy_look/utils/ui/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final MockDatabase databaseRepository;
  const LoginScreen({super.key, required this.databaseRepository});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String correctEmail = "MiaoMiao@mail.com";
  final String correctPassword = "MiaoMiao1!";

  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      if (emailController.text == correctEmail &&
          passwordController.text == correctPassword) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceholderScreenUser(
              username: emailController.text,
              title: 'Welcome',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrect email or password')),
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
                    return 'Bitte eine gültige E-Mail-Adresse eingeben';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              PasswordFieldWithLabel(
                label: "Password",
                placeholder: "Use a strong password",
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
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
                        onPressed: () {
                          _login();
                          print("Login successful");
                        }),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SignInScreen('Sign In Screen'),
                          ),
                        );
                      },
                      child: Text(
                        "No account? Sign In",
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
