import 'package:http/http.dart' as http;
import 'dart:convert';

class Icons_list{

  Icons_list(this. jsonArray);

  var jsonArray;

  Future<int> check(des_code) async{

    http.Response response = await http.get(jsonArray);
    List<dynamic> jsonData = jsonDecode(response.body);
    List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(jsonData);

    Map<String, dynamic> desiredData;

    //print(response.body);

    print(des_code);
    for (var item in data) {
      int code = item['code'];
      print(code);
      if (code == des_code) {
        des_code = item;
        print(des_code);
        return item['icon'];
      }
    }
    return 113;
  }
}