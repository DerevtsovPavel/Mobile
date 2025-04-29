import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String,dynamic>> getNasaData(String sol) async{
  Uri url = Uri.parse("https://api.nasa.gov/mars-photos/api/v1/rovers/${sol}/photos?sol=50&api_key=SSILOqXQVUZfxDA2dXOQRrSNAJ652MpRdrOiVP5s");
  final response = await http.get(url);

  if(response.statusCode == 200){
    return json.decode(response.body);
  }
  else{
    throw Exception('Error: ${response.reasonPhrase}');
  }

}