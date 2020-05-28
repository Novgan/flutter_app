import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiService {
  static Future<List<dynamic>> getPhotoList() async {
    final response = await http.get('https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');
    if (response.statusCode == 200){
      return json.decode(response.body);
    }else{
      return null;
    }
  }
}