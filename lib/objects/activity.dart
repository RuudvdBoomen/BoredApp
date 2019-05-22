class Activity {
  final String activity;
  final double accessibility;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;

  Activity(
      {this.activity,
      this.accessibility,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key});

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
