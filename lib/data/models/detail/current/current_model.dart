class Weather {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final List<WeatherCondition> weather;

  Weather({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      dt: json['dt'] as int? ?? 0,
      sunrise: json['sunrise'] as int? ?? 0,
      sunset: json['sunset'] as int? ?? 0,
      temp: json['temp'] as double? ?? 0.0,
      feelsLike: json['feels_like'] as double? ?? 0.0,
      pressure: json['pressure'] as int? ?? 0,
      humidity: json['humidity'] as int? ?? 0,
      dewPoint: json['dew_point'] as double? ?? 0,
      uvi: (json['uvi'] as num? ?? 0.0).toDouble(),
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      weather: (json['weather'] as List?)
              ?.map((e) => WeatherCondition.fromJson(e))
              .toList() ??
          [],
    );
  }

  @override
  String toString() {
    return '''
     dt: $dt,
     sunrise: $sunrise
     sunset: $sunset
     temp: $temp
     fellsLike: $feelsLike
     pressure: $pressure
     humidity: $humidity
     dewPoint: $dewPoint
     uvi: $uvi
     clouds: $clouds
     visibility: $visibility
     windSpeed: $windSpeed
     windDeg: $windDeg
     weather: ${weather.toString()}
    ''';
  }
}

class WeatherCondition {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherCondition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  @override
  String toString() {
    return '''
     id: $id,
     main: $main
     description: $description
     icon: $icon
    ''';
  }
}
