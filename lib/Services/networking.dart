import 'dart:convert';
import 'package:http/http.dart' as http;
import 'icon.dart';
import 'package:weatherly/constants.dart';

class NetworkHelper{

  NetworkHelper(this.str);

  final String str;

  Future getData() async{
    Uri url = Uri.parse(str);
    http.Response response = await http.get(url);

    if(response.statusCode==200){
      String data = response.body;

      Uri url = Uri.parse('https://www.weatherapi.com/docs/weather_conditions.json');

      var yy = jsonDecode(data);

      // Icons_list icon_ls = Icons_list(url, yy['current']['condition']['code']);
      // xx = await icon_ls.check();
      print('xx $xx');

      return yy;
      // var cur_data = decodedata['current'];
      // var location_data = decodedata['location'];
    }
    else{
      print(response.statusCode);
    }
  }

}