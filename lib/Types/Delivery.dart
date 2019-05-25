class Delivery {
  bool picked;
  int lockNumber;
  String token;
  DateTime delivered;
  int etage;

  Delivery({this.picked, this.lockNumber, this.token, this.delivered, this.etage});

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
        picked: json['picked'],
        lockNumber: json['lockNumber'],
        token: json['token'],
        delivered: DateTime.parse(json['delivered']),
        etage: json['station']['etage']);
  }
}