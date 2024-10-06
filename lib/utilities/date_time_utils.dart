class DateTimeUtils {
  static String getGreeting() {
    int hour = DateTime.now().hour;
    String? greeting;
    if (hour < 12) {
      greeting = "Selamat Pagi";
    } else if (hour < 15) {
      greeting = "Selamat Siang";
    } else if (hour < 18) {
      greeting = "Selamat Sore";
    } else {
      greeting = "Selamat Malam";
    }
    return greeting;
  }
}