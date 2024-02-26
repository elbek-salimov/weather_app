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
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temp: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      uvi: json['uvi'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherCondition.fromJson(e))
          .toList(),
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
