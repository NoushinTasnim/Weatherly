import 'networking.dart';
import 'location.dart';

const apiKey = '5ebe92123ad34562a7f114528210808';
const weatherAPIurl= 'http://api.weatherapi.com/v1/forecast.json';

class WeatherData{

  Future<dynamic> getCityWeather(String city) async{

    NetworkHelper networkHelper = NetworkHelper('$weatherAPIurl?key=$apiKey&q=$city&days=7&aqi=no');

    var data = await networkHelper.getData();

    print("hola bola $data");

    return data;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    var lat = location.latitude;
    var long = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('$weatherAPIurl?key=$apiKey&q=$lat,$long&aqi=no');

    var data = await networkHelper.getData();

    return data;
  }
}