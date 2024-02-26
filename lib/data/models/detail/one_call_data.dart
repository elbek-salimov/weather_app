import 'package:weather_app/data/models/detail/current/current_model.dart';
import 'package:weather_app/data/models/detail/minutely_item/minutely_item.dart';

import 'daily_item/daily_item.dart';
import 'hourly_item/hourly_item.dart';

class OneCallData {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final Weather current;
  final List<MinutelyItem> minutely;
  final List<HourlyItem> hourly;
  final List<DailyItem> daily;

  OneCallData({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.current,
    required this.daily,
    required this.minutely,
    required this.hourly,
    required this.timezoneOffset,
  });

  factory OneCallData.fromJson(Map<String, dynamic> json) => OneCallData(
        lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
        lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
        timezone: json['timezone'] as String? ?? '',
        current: Weather.fromJson(json['current']),
        daily: (json['daily'] as List<dynamic>?)
                ?.map((e) => DailyItem.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        hourly: (json['hourly'] as List<dynamic>?)
                ?.map((e) => HourlyItem.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        minutely: (json['minutely'] as List<dynamic>?)
                ?.map((e) => MinutelyItem.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        timezoneOffset: json['timezone_offset'] as int? ?? 0,
      );

  @override
  String toString() {
    return '''
     latitude: $lat,
     longitude: $lon
     timezone_offset: $timezoneOffset
     current: ${current.toString()}
     minutely: ${minutely.toString()}
     hourly: ${hourly.toString()}
     daily: ${daily.toString()}
    ''';
  }
}
