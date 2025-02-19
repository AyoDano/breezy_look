import 'package:breezy_look/modules/screens/home_screen.dart';
import 'package:breezy_look/modules/screens/signin_screen.dart';
import 'package:breezy_look/widgets/button_no_icon.dart';
import 'package:breezy_look/widgets/terms_and_privacy_text.dart';
import 'package:breezy_look/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final String title;
  const LoginScreen(this.title, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String correctEmail = "MiaoMiao@mail.com";
  final String correctPassword = "MiaoMiao1!";

  final _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      isButtonEnabled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      if (emailController.text == correctEmail &&
          passwordController.text == correctPassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
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
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a valid email'
                    : null,
              ),
              SizedBox(height: 10),
              PasswordFieldWithLabel(
                label: "Password",
                placeholder: "Use a strong password",
                controller: passwordController,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a password'
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: [
                    IconlessButtonWidget(
                      text: "Login",
                      onPressed: isButtonEnabled ? _login : null,
                    ),
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
