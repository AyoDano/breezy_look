import 'wardrobe.dart'; 
// Ich importiere aus dem Kleiderschrank, da ich die informationen 
// für meinen User benötige

// Erstellen der Klasse meiner User
class User {
  String username;
  String email;
  String password;
  Wardrobe wardrobe; // Jeder User hat seinen eigenen Kleiderschrank

// Passender Konstruktor für die Klasse mit verbindung zur Wardrobe datei
  User(this.username, this.email, this.password) : wardrobe = Wardrobe();

  // // Die Methoden die ausgeführt werden sollen in dieser  Klasse
  void displayUserInfo() {
    print("Username: $username\nEmail: $email");
  }
}