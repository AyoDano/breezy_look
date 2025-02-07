// Zu erst erstelle ich in dieser File meine Klasse Weather
// mit den passenden Attributren
class Weather {
  double temperature;
  String condition;
  String location;

// Nun Folgt der Konstruktor, welcher die Attribute der Klasse beinhaltet
// dieser ist Bestandteil für initialisierte Objekte vom Weather.
  Weather(this.temperature, this.condition, this.location);

// Die Methode displayWeather dient zum Anzeigen der Wetterinformationen
// es wirde Ausgegeben, was in der Klammer nach print kommt. Mit Hilfe
// von string interpolationen
  void displayWeather() {
    print(
        "Das Wetter in $location ist $condition mit einer Temperatur von: $temperature°C.");
  }

// Eine weitere Methode, um eventuelle wetterupdates auszugeben
// und die alten zu überschreiben, ohne dass es @override bedarf
// die neuen Parameter werden den alten Instanzen zugewiesen
  void updateWeather(String newCondition, double newTemperature) {
    condition = newCondition;
    temperature = newTemperature;
  }
}
