import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

Future<Map<String,dynamic>> getData() async{
  Position p = await Geolocator.getCurrentPosition();
  var start = DateTime.now().toUtc();

  String url = "https://api.stormglass.io/v2/weather/point?lat=${p.latitude}&lng=${p.longitude}&params=windSpeed,airTemperature&start=${start}&end=${start}";
  final response = await http.get(Uri.parse(url),
  headers: {
    'Authorization':'f80b5640-2e3b-11f0-b77d-0242ac130003-f80b56b8-2e3b-11f0-b77d-0242ac130003',
    'Accept': 'application/json',
  },
  );

  if(response.statusCode == 200){
    return json.decode(response.body);
  }
  else{
    throw Exception('Error: ${response.reasonPhrase}');
  }

}