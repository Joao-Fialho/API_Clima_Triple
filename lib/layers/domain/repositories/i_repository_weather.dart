import '../entities/weather_entity.dart';

abstract class IRepositoryWeather {
  Future<WeatherEntity> fetchClima(String cidade);
}
