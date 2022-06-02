import 'package:api_clima_dio_bloc/layers/domain/entities/weather_entity.dart';

class WeatherDto extends WeatherEntity {
  WeatherDto(
      {required String temperature,
      required String wind,
      required String description,
      required List<WeatherForecastDto> forecast})
      : super(
            temperature: temperature,
            wind: wind,
            description: description,
            forecast: forecast);

  @override
  String toString() {
    return 'WeatherEntity(temperature: $temperature, wind: $wind, description: $description, forecast: $forecast)';
  }

  static WeatherEntity fromJson(Map map) {
    final List<WeatherForecastDto> forecastList = [];
    for (final forecast in map['forecast']) {
      final forecastModel = WeatherForecastDto(
        day: forecast['day'],
        temperature: forecast['temperature'],
        wind: forecast['wind'],
      );

      forecastList.add(forecastModel);
    }

    return WeatherEntity(
      temperature: map['temperature'],
      wind: map['wind'],
      description: map['description'],
      forecast: forecastList,
    );
  }
}

class WeatherForecastDto extends WeatherForecast {
  WeatherForecastDto(
      {required String day, required String temperature, required String wind})
      : super(day: day, temperature: temperature, wind: wind);
  @override
  String toString() {
    return 'WeatherEntity(day: $day, temperature: $temperature, wind: $wind,)';
  }
}
