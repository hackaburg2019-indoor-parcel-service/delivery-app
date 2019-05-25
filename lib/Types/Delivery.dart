class Delivery {
  bool picked;
  int lockNumber;
  String token;
  DateTime delivered;

  Delivery({this.picked, this.lockNumber, this.token, this.delivered});

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
        picked: json['picked'],
        lockNumber: json['lockNumber'],
        token: json['token'],
        delivered: DateTime.parse(json['delivered']));
  }
}