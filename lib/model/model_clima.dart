class ModelClima {
  final String temperature;
  final String wind;
  final String description;
  final List<ModelForecast> forecast;

  ModelClima({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,

    // required this.forecast,
  });

  @override
  String toString() {
    return 'ModelClima(temperature: $temperature, wind: $wind, description: $description, forecast: $forecast)';
  }

  static ModelClima fromJson(Map map) {
    final List<ModelForecast> forecastList = [];
    for (final forecast in map['forecast']) {
      final forecastModel = ModelForecast(
        day: forecast['day'],
        temperature: forecast['temperature'],
        wind: forecast['wind'],
      );

      forecastList.add(forecastModel);
    }

    return ModelClima(
      temperature: map['temperature'],
      wind: map['wind'],
      description: map['description'],
      forecast: forecastList,
    );
  }
}

class ModelForecast {
  final String day;
  final String temperature;
  final String wind;

  ModelForecast({
    required this.day,
    required this.temperature,
    required this.wind,
    // required this.forecast,
  });

  @override
  String toString() {
    return 'ModelClima(day: $day, temperature: $temperature, wind: $wind,)';
  }
}
