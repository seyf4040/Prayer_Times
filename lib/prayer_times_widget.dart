import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrayerTimesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerTimesProvider>(
      builder: (context, provider, _) {
        if (provider.prayerTimes == null) {
          return CircularProgressIndicator(); // Display loading indicator while fetching prayer times
        } else {
          return Column(
            children: [
              Text('Fajr: ${provider.prayerTimes!.fajr}'),
              Text('Dhuhr: ${provider.prayerTimes!.dhuhr}'),
              Text('Asr: ${provider.prayerTimes!.asr}'),
              Text('Maghrib: ${provider.prayerTimes!.maghrib}'),
              Text('Isha: ${provider.prayerTimes!.isha}'),
            ],
          );
        }
      },
    );
  }
}

class PrayerTimes {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayerTimes({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });
}

class PrayerTimesProvider with ChangeNotifier {
  PrayerTimes? _prayerTimes;

  PrayerTimes? get prayerTimes => _prayerTimes;

  // Method to fetch and update the prayer times
  Future<void> fetchPrayerTimes() async {
    // Fetch prayer times from an API or any other source
    // For simplicity, let's assume the prayer times are fetched here
    // as a hardcoded value for demonstration purposes
    await Future.delayed(Duration(seconds: 2));

    _prayerTimes = PrayerTimes(
      fajr: '5:30 AM',
      dhuhr: '12:30 PM',
      asr: '4:00 PM',
      maghrib: '7:15 PM',
      isha: '9:00 PM',
    );

    notifyListeners(); // Notify listeners about the updated prayer times
  }
}
