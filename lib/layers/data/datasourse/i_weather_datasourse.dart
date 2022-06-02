import '../../domain/entities/weather_entity.dart';

abstract class IWeatherDatasourse {
  Future<WeatherEntity> fetchClima(cidade);
}
