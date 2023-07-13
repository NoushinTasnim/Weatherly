import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'location_screen.dart';
import '../Services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    final PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      var weatherData = await WeatherData().getLocationWeather();

      if (weatherData == null) {
        print(weatherData);
      }

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LocationScreen(locationData: weatherData);
        }));
        // Location permission granted, you can proceed with location-related tasks
      }
      else if (status.isDenied) {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text('Location Permission Required'),
              content: Text(
                  'Please grant location permission to use this feature.'),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                ),
                TextButton(
                  child: Text('Open Settings'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    openAppSettings();
                  },
                ),
              ],
            );
          },
        );
        // Location permission denied
      }
      else if (status.isPermanentlyDenied) {
        // Location permission permanently denied, navigate to app settings
        openAppSettings();
      }
    }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 75.0,
        ),
      ),
    );
  }
}
