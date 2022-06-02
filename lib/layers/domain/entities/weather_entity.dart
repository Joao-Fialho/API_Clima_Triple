class WeatherEntity {
  final String temperature;
  final String wind;
  final String description;
  final List<WeatherForecast> forecast;

  WeatherEntity({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,

    // required this.forecast,
  });

}

class WeatherForecast {
  final String day;
  final String temperature;
  final String wind;

  WeatherForecast({
    required this.day,
    required this.temperature,
    required this.wind,
    // required this.forecast,
  });


}
