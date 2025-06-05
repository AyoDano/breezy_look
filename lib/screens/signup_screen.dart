import 'package:breezy_look/screens/app_navigationbar.dart';
import 'package:breezy_look/screens/login_screen.dart';
import 'package:breezy_look/services/google_auth_service.dart';
import 'package:breezy_look/utils/ui/widgets/button_no_icon.dart';
import 'package:breezy_look/utils/ui/widgets/terms_and_privacy_text.dart';
import 'package:breezy_look/utils/ui/widgets/textfield_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  final String title;
  const SignUpScreen(this.title, {super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

  Future<void> _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AppNavigation()),
        );
      } on FirebaseAuthException catch (e) {
        String message = 'Registration failed';
        if (e.code == 'email-already-in-use') {
          message = 'An account already exists for this email.';
        } else if (e.code == 'weak-password') {
          message = 'The password is too weak.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _signUpWithGoogle() async {
    final user = await GoogleAuthService().signInWithGoogle();
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AppNavigation()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-Up failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 0),
              Image.asset(
                "assets/icons/app_icon/icon_breezylook_transparent.png",
                fit: BoxFit.contain,
                width: 100,
              ),
              SizedBox(height: 24),
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
                    ? 'Please confirm your password'
                    : null,
              ),
              SizedBox(height: 40),
              IconlessButtonWidget(
                text: "Sign Up",
                onPressed: isButtonEnabled ? _signUp : null,
              ),
              SizedBox(height: 16),
              Text('or', style: TextStyle(fontWeight: FontWeight.w800)),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _signUpWithGoogle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/google_icon.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Google Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => LoginScreen(),
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
              SizedBox(height: 12),
              TermsAndPrivacyText(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
