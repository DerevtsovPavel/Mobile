import 'Hours.dart';
import 'Meta.dart';
class weather {
  List<Hours>? hours;
  Meta? meta;

  weather({this.hours, this.meta});

  weather.fromJson(Map<String, dynamic> json) {
    if (json['hours'] != null) {
      hours = <Hours>[];
      json['hours'].forEach((v) {
        hours!.add(new Hours.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hours != null) {
      data['hours'] = this.hours!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}