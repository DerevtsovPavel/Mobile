import 'Air_Temperature.dart';
class Hours {
  AirTemperature? airTemperature;
  String? time;
  AirTemperature? windSpeed;

  Hours({this.airTemperature, this.time, this.windSpeed});

  Hours.fromJson(Map<String, dynamic> json) {
    airTemperature = json['airTemperature'] != null
        ? new AirTemperature.fromJson(json['airTemperature'])
        : null;
    time = json['time'];
    windSpeed = json['windSpeed'] != null
        ? new AirTemperature.fromJson(json['windSpeed'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.airTemperature != null) {
      data['airTemperature'] = this.airTemperature!.toJson();
    }
    data['time'] = this.time;
    if (this.windSpeed != null) {
      data['windSpeed'] = this.windSpeed!.toJson();
    }
    return data;
  }
}