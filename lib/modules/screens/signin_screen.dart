import 'package:breezy_look/modules/data/repositories/mock_database.dart';
import 'package:breezy_look/modules/screens/home_screen.dart';
import 'package:breezy_look/modules/screens/login_screen.dart';
import 'package:breezy_look/widgets/button_no_icon.dart';
import 'package:breezy_look/widgets/terms_and_privacy_text.dart';
import 'package:breezy_look/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final String title;
  const SignInScreen(this.title, {super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      isButtonEnabled = usernameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }

  void _signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      if (passwordController.text == confirmPasswordController.text) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/icons/app_icon/icon_breezylook_transparent.png",
                  fit: BoxFit.contain,
                  width: 100,
                ),
              ),
              TextFieldWithLabel(
                label: "Username",
                placeholder: "Choose a username",
                controller: usernameController,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a username'
                    : null,
              ),
              SizedBox(height: 10),
              EmailFieldWithLabel(
                label: "Email",
                placeholder: "Example@mail.com",
                controller: emailController,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please use a valid E-Mail'
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
              SizedBox(height: 10),
              PasswordFieldWithLabel(
                label: "Confirm Password",
                placeholder: "Confirm your password",
                controller: confirmPasswordController,
                isLabelVisible: false,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a password'
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: [
                    IconlessButtonWidget(
                      text: "Sign In",
                      onPressed: isButtonEnabled
                          ? _signUp
                          : null, // Button will be deactivated if fields are empty
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(
                              databaseRepository: MockDatabase(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Already a user? Log In",
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
