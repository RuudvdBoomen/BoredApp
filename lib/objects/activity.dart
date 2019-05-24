class Activity {
  String activity;
  double accessibility;
  String type;
  int participants;
  double price;
  String link;
  String key;
  String error;

  Activity(
      {this.activity,
      this.accessibility,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key});

  Activity.withError(this.error);

  factory Activity.fromError(error) {
    return Activity.withError(error);
  }

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
        activity: json['activity'],
        accessibility: json['accessibility'].toDouble(),
        type: json['type'],
        participants: json['participants'],
        price: json['price'].toDouble(),
        link: json['link'],
        key: json['key']);
  }
}
