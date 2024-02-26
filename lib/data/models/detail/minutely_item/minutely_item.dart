class MinutelyItem {
  final int dt;
  final int precipitation;

  MinutelyItem({
    required this.dt,
    required this.precipitation,
  });

  factory MinutelyItem.fromJson(Map<String, dynamic> json) => MinutelyItem(
    dt: json['dt'] as int? ?? 0,
    precipitation: json['precipitation'] as int? ?? 0,
  );

  @override
  String toString() {
    return '''
     dt: $dt,
     precipitation: $precipitation
    ''';
  }
}
