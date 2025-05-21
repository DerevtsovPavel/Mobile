class AirTemperature {
  double? ecmwf; //ok
  double? noaa;
  double? sg;

  AirTemperature({this.ecmwf, this.noaa, this.sg});

  AirTemperature.fromJson(Map<String, dynamic> json) {
    ecmwf = json['ecmwf'];
    noaa = json['noaa'];
    sg = json['sg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ecmwf'] = this.ecmwf;
    data['noaa'] = this.noaa;
    data['sg'] = this.sg;
    return data;
  }
}