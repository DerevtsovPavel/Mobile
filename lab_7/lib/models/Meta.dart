class Meta {
  int? cost;
  int? dailyQuota;
  String? end;
  double? lat;
  double? lng;
  List<String>? params;
  int? requestCount;
  String? start;

  Meta(
      {this.cost,
      this.dailyQuota,
      this.end,
      this.lat,
      this.lng,
      this.params,
      this.requestCount,
      this.start});

  Meta.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    dailyQuota = json['dailyQuota'];
    end = json['end'];
    lat = json['lat'];
    lng = json['lng'];
    params = json['params'].cast<String>();
    requestCount = json['requestCount'];
    start = json['start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cost'] = this.cost;
    data['dailyQuota'] = this.dailyQuota;
    data['end'] = this.end;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['params'] = this.params;
    data['requestCount'] = this.requestCount;
    data['start'] = this.start;
    return data;
  }
}