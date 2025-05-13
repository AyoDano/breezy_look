import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Stream für den Login-Status
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Registrierung
  Future<UserCredential> signUp(String email, String password) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  // Login
  Future<UserCredential> signIn(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  // Logout
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
